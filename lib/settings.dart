import 'package:bibletrainer/drawer.dart';
import 'package:flutter/material.dart';

class SettingRoute extends StatelessWidget {
  const SettingRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavDrawer(),
      appBar: AppBar(title: const Text('Settings')),
      body: Center(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        ListTile(
            title: const Text('Use Sans Forgetica font'),
            subtitle: const Text(
                'Sans Forgetica is a font designed with t eprinciples of cognitive psychology to help memorisation.')),
        ListTile(
            title: const Text('YHWH'),
            subtitle: const Text('Replace "The LORD" with "YHWH"')),
        ListTile(
            title: const Text('Emoji mode'),
            subtitle: const Text(
                'Adds emoji 👋 in the passage text 📖 to aid memorisation 🧠 with pictures 🖼️.')),
        ListTile(
            title: const Text('Left handed mode'),
            subtitle: const Text('TODO')),
        ListTile(
            title: const Text('Display passage by last read date'),
            subtitle: const Text('Defaults to Biblical order')),
        ListTile(
            title: const Text('Days until review'),
            subtitle: const Text('TODO: 7')),
      ])),
    );
  }
}
