import 'package:flutter/material.dart';
import 'package:my_trial_first_app/login_page.dart';
// import 'login_page.dart';
import 'signup_page.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
