import 'package:flutter/material.dart';

class Responsive {
  static const double designHeight = 829;   //my pixel 4 mobile screen height that i used to design the UI
  static const double designWidth = 392;

    static double screenHeight = 0;
  static double screenWidth = 0;

  static void init(BuildContext context) {
    print("I am called");
    screenHeight = MediaQuery.of(context).size.height;  //screenheight of any device using the app
    screenWidth = MediaQuery.of(context).size.width;
  }

  static double height(double designPx) {
    return (designPx / designHeight) * screenHeight; 
     //eg : given container designpx / 1% of the design height and multiplied by screenheight to maintain similar content 
  }

  static double width(double designPx) {
    return (designPx / designWidth) * screenWidth;
  }
}