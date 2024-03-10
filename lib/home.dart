import 'package:bibletrainer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bibletrainer/book_list.dart';
import 'package:get_it/get_it.dart';
import 'package:bibletrainer/data/passage.dart';
import 'package:bibletrainer/data/passage_repo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.title = "BibleTrainer"});
  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  bool _sansForgetica = false;
  String _reviewPeriod = "7";
  PassageRepo _passageRepo = GetIt.I.get();
  List<Passage> _passages = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // App settings
    final prefs = await SharedPreferences.getInstance();

    // Passage data
    final passages = await _passageRepo.getAllPassages();

    // Set the state
    setState(() {
      _sansForgetica = prefs.getBool('settings_sansForgetica') ?? false;
      _reviewPeriod = prefs.getString('settings_reviewPeriod') ?? "7";
      _passages = passages;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(fontFamily: 'sansForgetica'),
        ),
      ),
      body: Center(
        // child: ListView(
        //   padding: EdgeInsets.zero,
        //   children: <Widget>[
        //     ListTile(
        //         title: const Text('SanForget setting…'),
        //         subtitle: Text(_sansForgetica.toString())),
        //     ListTile(
        //         title: const Text('Review period setting…'),
        //         subtitle: Text(_reviewPeriod.toString())),
        //   ],
        // ),
        child: ListView.builder(
          itemCount: _passages.length,
          itemBuilder: (context, index) {
            final passage = _passages[index];
            return ListTile(title: Text(passage.title));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PassageLookupRoute()),
          );
        },
        label: const Text('Add passage'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
