import 'package:flutter/material.dart';
import 'package:bibletrainer/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal.shade900),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BibleTrainer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final MaterialColor teal = Colors.teal;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Drawer Tutorial',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(title: 'Home'),
    );

    // @override
    // Widget build(BuildContext context) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //       title: Text(
    //         widget.title,
    //         textAlign: TextAlign.left,
    //       ),
    //     ),
    //     drawer: Drawer(
    //         child: ListView(padding: EdgeInsets.zero, children: <Widget>[
    //       const DrawerHeader(
    //         decoration: BoxDecoration(
    //           color: Colors.teal,
    //         ),
    //         child: Text("BibleTrainer",
    //             style: TextStyle(color: Colors.white, fontSize: 24)),
    //       ),
    //       ListTile(
    //           leading: Icon(Icons.add),
    //           title: Text("Add passage"),
    //           onTap: () {
    //             print('TODO - Add Passage');
    //           }),
    //       ListTile(
    //           leading: Icon(Icons.search),
    //           title: Text("Search for passage"),
    //           onTap: () {
    //             print('TODO - Search Passage');
    //           }),
    //       ListTile(
    //           leading: Icon(Icons.help_outline),
    //           title: Text("Help"),
    //           onTap: () {
    //             Navigator.push(
    //               context,
    //               MaterialPageRoute(builder: (context) => const AboutRoute()),
    //             );
    //             print('Navigation -> About');
    //           }),
    //       ListTile(
    //           leading: Icon(Icons.settings),
    //           title: Text("Settings"),
    //           onTap: () {
    //             print('TODO - Settings');
    //           })
    //     ])),
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           const Text(
    //             'You have pushed the button this many times:',
    //           ),
    //           Text(
    //             '$_counter',
    //             style: Theme.of(context).textTheme.headlineMedium,
    //           ),
    //         ],
    //       ),
    //     ),
    //     floatingActionButton: FloatingActionButton(
    //       onPressed: _incrementCounter,
    //       tooltip: 'Increment',
    //       child: const Icon(Icons.add),
    //     ),
    //   );
  }
}
