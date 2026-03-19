import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Theme/app_color.dart';
import 'package:my_trial_first_app/widgets/App/AppBar/custom_appbar.dart';

class AppVersionPage extends StatelessWidget {
  const AppVersionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(
        title: "App Version",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            Icon(Icons.system_update, size: 60),
            SizedBox(height: 16),
            Text(
              "My Trial First App",
              style: GoogleFonts.openSans(
                    color: AppColors.darktextblue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
          ],
        ),
      ),
    );
  }
}