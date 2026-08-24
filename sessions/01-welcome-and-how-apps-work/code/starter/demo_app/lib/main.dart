// lib/main.dart
//
// Session 1 demo project — Flutter for Beginners, Module 0.
//
// This is the small app shown on screen in Session 1. You are NOT expected
// to type this, understand it, or run it yet — you do not have Flutter
// installed until Session 2. It is here so you can look at real Flutter
// code with your own eyes. Widgets get their proper lesson in Session 10.

import 'package:flutter/material.dart';

void main() {
  runApp(const DemoApp());
}

// One widget describes the whole app.
// A widget is one visible piece of the screen — that is the definition
// from Session 1, and this class is a live example of it.
class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Session 1 Demo',
      // Material 3 is this course's default look. colorSchemeSeed takes one
      // colour and generates a full, readable palette from it.
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.deepPurple,
      ),
      home: const DemoScreen(),
    );
  }
}

class DemoScreen extends StatelessWidget {
  const DemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Course — Session 1'),
      ),
      body: const Center(
        // This is the line the session points at:
        // one widget, one sentence, on the screen.
        child: Text(
          'Hello, future developer!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
