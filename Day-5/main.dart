

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Day 5 - Flutter Setup')),
        body: const Center(
          child: Text(
            'Flutter Architecture & SDK Setup',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
