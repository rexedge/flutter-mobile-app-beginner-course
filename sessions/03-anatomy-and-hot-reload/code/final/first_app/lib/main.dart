// lib/main.dart
//
// Session 3 end state. The same counter template from Session 2, after
// the session's four hot-reload edits: the MaterialApp title, the seed
// color, the home screen's title text, and the floating action button's
// icon. Each one was applied to a running app via hot reload, one at a
// time, without ever restarting — that live sequence is the point.
//
// Yours will differ: edit 3 is meant to be personalized. StatefulWidget
// and setState are still not taught in depth until Session 16.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Edit 1: app-switcher title, changed via hot reload.
      title: 'My First Flutter App',
      theme: ThemeData(
        // Edit 2: seed color swapped from Colors.deepPurple — this one
        // line reflows the entire app's color scheme.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      // Edit 3: the home screen's AppBar title text. Put your own name
      // here — this line is meant to be yours.
      home: const MyHomePage(title: 'My First App'),
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

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Break-it drill: this was briefly misspelled as `onPresed` on
        // purpose, to trigger a hot-reload compile error — then corrected
        // back to `onPressed` right here.
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        // Edit 4: icon swapped from Icons.add.
        child: const Icon(Icons.thumb_up),
      ),
    );
  }
}
