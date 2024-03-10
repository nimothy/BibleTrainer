import 'package:flutter/material.dart';
import 'package:bibletrainer/home.dart';
import 'package:bibletrainer/data/init.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const MyApp({super.key});

  final Future _init = Init.initialize();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BibleTrainer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal.shade900),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return const MyHomePage(title: 'BibleTrainer');
          } else {
            return const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
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
  final MaterialColor teal = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BibleTrainer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(title: 'BibleTrainer'),
    );
  }
}
