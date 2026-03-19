import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Responsive/responsive.dart';
import 'package:my_trial_first_app/Theme/app_color.dart';
import 'package:my_trial_first_app/widgets/App/AppBar/custom_appbar.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:CustomAppbar(title: "ABOUT APP"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [

            SizedBox(height: Responsive.height(50),),
           

            Icon(
              Icons.apps,
              size: 80,
              color: Colors.blue,
            ),

            SizedBox(height: 16),

            Text(
              "POSHPIN",
              style: GoogleFonts.poppins(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.darktextblue
              ),
            ),

            SizedBox(height: 8),

            Text(
              "Version 1.0.0",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            SizedBox(height: 24),

            Text(
              "This app is designed to provide a smooth and simple user experience. "
              "It includes features like navigation, profile management, and more.",
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(fontSize: 16),
            ),

            SizedBox(height: 24),

            Divider(),

            SizedBox(height: 16),

            Text(
              "Developed by",
              style: GoogleFonts.openSans(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                
              ),
            ),

            SizedBox(height: 4),

            Text(
              "The Pradhan",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: AppColors.darktextblue,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}