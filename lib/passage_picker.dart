import 'package:bibletrainer/drawer.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PassagePicker extends StatefulWidget {
  final String bookTitle;
  final int bookChapter;

  const PassagePicker({
    super.key,
    required this.bookTitle,
    required this.bookChapter,
  });

  @override
  _PassagePickerState createState() => _PassagePickerState();
}

class _PassagePickerState extends State<PassagePicker> {
  late List<dynamic> _data = [];

  bool get areVersesSelected {
    if (_data.isEmpty) {
      return false;
    }
    // Use any() method to check if any element satisfies the condition
    return _data.any((element) => element['selected'] == true);
  }

  List<dynamic> get selectedVerses {
    if (_data.isEmpty) {
      return [];
    }

    // Use where() method to filter the list based on the condition
    return _data.where((element) => element['selected'] == true).toList();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final String bookTitle = widget.bookTitle;
    final int bookChapter = widget.bookChapter;

    // TODO: Swap with ESV API
    String apiLookup = 'https://bible-api.com/$bookTitle+$bookChapter';

    if (bookTitle.toLowerCase() == 'obadiah') {
      apiLookup = 'https://bible-api.com/obadiah+1-21';
    }

    if (bookTitle.toLowerCase() == 'philemon') {
      apiLookup = 'https://bible-api.com/philemon+1-25';
    }

    if (bookTitle.toLowerCase() == '2 john') {
      apiLookup = 'https://bible-api.com/2%20john+1-13';
    }

    if (bookTitle.toLowerCase() == '3 john') {
      apiLookup = 'https://bible-api.com/3%20john+1-14';
    }

    if (bookTitle.toLowerCase() == 'jude') {
      apiLookup = 'https://bible-api.com/jude+1-25';
    }

    try {
      final response = await http.get(Uri.parse(apiLookup));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = jsonDecode(response.body)['verses'];

        for (var item in jsonData) {
          item['selected'] = false;
        }

        setState(() {
          _data = jsonData;
        });
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      // TODO: Better error handling
      print('Error fetching data: $e');
    }

    // Rerender
    setState(() {});
  }

  Future<void> _toggleVerse(int index) async {
    _data[index]['selected'] = !_data[index]['selected'];
    setState(() {});
  }

  void _addVerses() {
    print(selectedVerses);
  }

  @override
  Widget build(BuildContext context) {
    final String bookTitle = widget.bookTitle;
    final int bookChapter = widget.bookChapter;

    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: Text('$bookTitle, Ch $bookChapter')),
      body: _data.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: ListView.builder(
                itemCount: _data.length,
                padding: EdgeInsets.only(bottom: 80),
                itemBuilder: (context, index) {
                  final item = _data[index];
                  return CheckboxListTile(
                      value: item['selected'],
                      title: RichText(
                          text: TextSpan(
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(
                            text: '${index + 1} ',
                            style: TextStyle(
                              fontSize:
                                  DefaultTextStyle.of(context).style.fontSize! *
                                      0.8,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: item['text'],
                            style: DefaultTextStyle.of(context)
                                .style
                                .apply(fontSizeFactor: 0.9),
                          )
                        ],
                      )),
                      onChanged: (bool? value) {
                        // Handle tap on item
                        _toggleVerse(index);
                      });
                },
              ),
            ),
      floatingActionButton: _data.isNotEmpty && areVersesSelected
          ? FloatingActionButton.extended(
              onPressed: () {
                //todo
                _addVerses();
              },
              label: const Text('Add verses'),
              icon: const Icon(Icons.add))
          : null,
    );
  }
}
