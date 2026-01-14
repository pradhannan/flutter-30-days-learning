import 'package:flutter/material.dart';
import 'package:my_trial_first_app/config/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRect(
                  child: Align(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.88, // lower = less bottom space
                    child: SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.55,
                      child: Image.asset(
                        "assets/firstscreen_pic.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                // Text("test"),
                Text(
                  "POSHPIN",
                  style: GoogleFonts.poppins(
                    
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darktextblue,
                    letterSpacing: 3,
                  ),
                ),
                Text(
                  "YOUR OWN STYLE",
                  style: GoogleFonts.sofia(
                    fontSize: 16,

                    fontWeight: FontWeight.bold,
                    color: AppColors.textblue,
                    letterSpacing: 1,
                  ),
                ),

                SizedBox(height: 50),

                SizedBox(
                  width: 230,
                  height: 50,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonblue,
                      elevation: 5,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                SizedBox(
                  width: 230,
                  height: 50,

                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                   
                      backgroundColor: Colors.white,
                      elevation: 5,
                      side: BorderSide(color: AppColors.buttonblue, width: 1.0),
                      padding: EdgeInsets.symmetric(horizontal: 16),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),

                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.buttonblue,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Continue as guest",
                    style: TextStyle(color: AppColors.greyblue, fontSize: 16),
                  ),
                ),

                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
