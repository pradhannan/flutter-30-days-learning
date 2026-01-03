import 'package:flutter/material.dart';

class CounterAppp extends StatefulWidget {
  const CounterAppp({super.key});

  @override
  State<CounterAppp> createState() => _CounterApppState();
}

class _CounterApppState extends State<CounterAppp> {
  int count = 0;

    void increment() {
      setState(() {
        count++; // value changes but in UI does NOT update
        print(count); 
      });
    }
  @override
  Widget build(BuildContext context) {
    print('build called');  //screen build is called everytime
    
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