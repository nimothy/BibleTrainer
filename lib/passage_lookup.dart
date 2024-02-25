import 'package:bibletrainer/drawer.dart';
import 'package:flutter/material.dart';
import 'data/bible_info.dart';

class PassageLookupRoute extends StatelessWidget {
  const PassageLookupRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: const Text('Passage lookup')),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: bibleBooks.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return GestureDetector(
              onTap: () {
                print('Oh hai: ' +
                    bibleBooks[index]['name'] +
                    ' with ' +
                    bibleBooks[index]['chapterCount'].toString() +
                    ' chapters.');
              },
              child: Container(
                  height: 50,
                  child: Center(
                    child: Text(bibleBooks[index]['name']),
                  )),
            );
          },
        ),
      ),
    );
  }
}
