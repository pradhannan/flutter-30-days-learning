import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'counter_controller.dart';

class CounterReactivePage extends StatelessWidget {
  const CounterReactivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterController controller =
        Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(title: Text("Reactive Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  "Count: ${controller.count.value}",
                  style: TextStyle(fontSize: 30),
                )),
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.add_circle, size: 50, color: Colors.green),
              onPressed: controller.increment,
            ),
          ],
        ),
      ),
    );
  }
}
