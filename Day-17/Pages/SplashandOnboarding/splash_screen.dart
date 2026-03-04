import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trial_first_app/Controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
   final SplashController controller = Get.put(SplashController());
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Put controller here. It will call onInit automatically
   

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child:SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.45,
                      child: Image.asset(
                        "assets/LOGOPIC.png",
                        fit: BoxFit.cover,
                      ),)
      ),
    );
  }
}
