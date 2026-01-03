import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'counter_controller.dart';


// Controller (CounterController) → stores the value and handles logic

// UI (CounterPage2) → displays the value and gives the user a button to click

// GetBuilder → listens to the controller and rebuilds only the widgets you want

class CounterPage2 extends StatelessWidget {
  const CounterPage2({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    final CounterController controller = Get.put(CounterController());    //creates the controller if it doesn’t exist yet

    return Scaffold(
      appBar: AppBar(title: Text("GetBuilder Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            GetBuilder<CounterController>(    //Only what's written inside it is rebuild 
            //Widget that listens to controller and rebuilds when update() is called
              builder: (_) {
                return Text(
                  "Count: ${controller.count}",
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            SizedBox(height: 20),  //these doesn't rebuild
            IconButton(
              icon: Icon(Icons.add_circle, size: 50, color: Colors.blue),
              onPressed: controller.increment, // This triggers the counter
            ),
          ],
        ),
      ),
    );
  }
}
