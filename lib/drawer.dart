import 'package:flutter/material.dart';
import 'package:bibletrainer/home.dart';
import 'package:bibletrainer/about.dart';
import 'package:bibletrainer/book_list.dart';
import 'package:bibletrainer/settings.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.teal,
          ),
          child: Text("BibleTrainer",
              style: TextStyle(
                  fontFamily: 'sansForgetica',
                  color: Colors.white,
                  fontSize: 24)),
        ),
        ListTile(
            leading: Icon(Icons.list),
            title: Text("Passage List"),
            onTap: () {
              // TODO: Check if this is the current view… if it is just close
              // the drawer without navigation

              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeScreen()),
              );
            }),
        ListTile(
            leading: Icon(Icons.add),
            title: Text("Add passage"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PassageLookupRoute()),
              );
              print('Navigation - Passage Lookup');
            }),
        ListTile(
            leading: Icon(Icons.search),
            title: Text("Search for passage"),
            onTap: () {
              Navigator.pop(context);
              print('Navigation -> Passage Search');
            }),
        ListTile(
            leading: Icon(Icons.help_outline),
            title: Text("Help"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutRoute()),
              );
              print('Navigation -> About');
            }),
        ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingRoute()),
              );
              print('Navigation -> Settings');
            })
      ])),
    );
  }
}
