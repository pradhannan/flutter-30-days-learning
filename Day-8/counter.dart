import 'package:flutter/material.dart';

class CounterApp extends StatefulWidget {
  const CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;

    void increment() {
      count++; // value changes but in UI does NOT update
      print(count); //we can see the value change in console
    }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Day-8 State Management"),
      ),
      body: Center(
        child: Column(
          children: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                increment();
              }
            ),
            Text(
              'Count: $count',
              style: const TextStyle(fontSize: 24),
            ),
          
          ],
        ),
      ),
    );
  }
}