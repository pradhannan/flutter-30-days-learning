import 'package:get/get.dart';

// Step 1: Controller
class CounterController extends GetxController {
  // int count = 0; // regular variable
   var count = 0.obs; // reactive variable

  void increment() {
    // count++;
    // print("Count is now: $count");
    // update(); // <-- important for GetBuilder
    // //Manually tells GetBuilder to rebuild its child widgets

    count.value++;        // update reactive variable
    print("Count is now: ${count.value}");


  }
}
