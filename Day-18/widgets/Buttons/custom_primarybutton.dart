import 'package:flutter/material.dart';
import 'package:my_trial_first_app/widgets/App/app_color.dart';

class CustomPrimarybutton extends StatelessWidget {
  final String text;
  final double width; 
  final VoidCallback onPressed;
  const CustomPrimarybutton({super.key, required this.text, required this.onPressed, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
       width: width,
                  height: 45,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonblue,
          elevation: 5,
          side: BorderSide(color: Colors.white, width: 1.0),
          padding: EdgeInsets.symmetric(horizontal: 16),
                        
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
        child: Text(text,
        
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
