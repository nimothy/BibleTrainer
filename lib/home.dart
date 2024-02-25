import 'package:bibletrainer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bibletrainer/passageLookup.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.title = "BibleTrainer"});
  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  bool _sansForgetica = false;
  String _reviewPeriod = "7";

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _sansForgetica = prefs.getBool('settings_sansForgetica') ?? false;
      _reviewPeriod = prefs.getString('settings_reviewPeriod') ?? "7";
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
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        ListTile(
            title: const Text('SanForget setting…'),
            subtitle: Text(_sansForgetica.toString())),
        ListTile(
            title: const Text('Review period setting…'),
            subtitle: Text(_reviewPeriod.toString())),
      ])),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PassageLookupRoute()),
          );
          print('Navigation -> About');
        },
        label: const Text('Add passage'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
