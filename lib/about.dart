import 'package:bibletrainer/drawer.dart';
import 'package:bibletrainer/home.dart';
import 'package:flutter/material.dart';

class AboutRoute extends StatelessWidget {
  const AboutRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: const Text('About…')),
      body: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
                title: const Text('Home Screen'),
                subtitle: const Text(
                    'The home screen will have the list of passage your are memorising. To add new passages, tap the add passage button.')),
            ListTile(
                title: const Text('Bible Translations'),
                subtitle: const Text(
                    'Currently only the ESV is supported due to licensing. We are looking into adding further translations.')),
            ListTile(
                title: const Text('Feedback'),
                subtitle: const Text(
                    'If you have any feedback about BibleTrainer, please email bibletrainer@gmail.com.')),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text('Go to passage list '),
            ),
          ],
        ),
      ),
    );
  }
}
