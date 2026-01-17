import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_trial_first_app/Pages/welcomepage.dart';
import 'package:my_trial_first_app/config/bottom_nav_bar.dart';
import 'Pages/login_page.dart';
import 'Pages/signup_page.dart';
import 'Pages/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // '/':(context) =>WelcomePage(),
        // '/login': (context)=>LoginPage(),
        // '/signup':(context) =>SignupPage(),
        
        
      },
      home: const BottomNavBar(),

      
      

    );
  }
}
