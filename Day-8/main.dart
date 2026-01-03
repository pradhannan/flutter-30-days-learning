import 'package:flutter/material.dart';
import 'package:my_trial_first_app/coumter3.dart';
// import 'package:my_trial_first_app/counter2.dart';
// import 'package:my_trial_first_app/countersetstate.dart';
// import 'package:my_trial_first_app/login_page.dart';
// import 'login_page.dart';
// import 'signup_page.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Login Demo',
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => LoginPage(),
      //   '/signup': (context) => SignupPage(),
      // },
      debugShowCheckedModeBanner: false,

      // home: CounterApp(), //to show how how the value of counter changes but doesn't reflect in UI
      // home: CounterAppp(), //to show how how the value of counter changes and reflect in UI with setstate
      //home:CounterPage2() , //to show how getbuilder works
      home: CounterReactivePage(), //to showcase use pf reactuve variable
    );
  }
}
