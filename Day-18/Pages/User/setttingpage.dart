import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Responsive/responsive.dart';
import 'package:my_trial_first_app/widgets/App/app_color.dart';
import 'package:my_trial_first_app/widgets/App/custom_appbar.dart';
import 'package:my_trial_first_app/widgets/App/profileedit.dart';
import 'package:my_trial_first_app/widgets/App/profilemenuitem.dart';

class Setttingpage extends StatefulWidget {
  const Setttingpage({super.key});

  @override
  State<Setttingpage> createState() => _SetttingpageState();
}

class _SetttingpageState extends State<Setttingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(title: "Settings"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Responsive.width(16), vertical:  Responsive.height(24)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.backgoundlightblue,
                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Profileedit(
                    title: "Full name",
                    subtitle: "user@gmail.com",
                  ),
                ),
                SizedBox(height: Responsive.height(16)),
                Text(
                  "Account and Subscription",

                  style: GoogleFonts.openSans(
                    color: AppColors.darktextblue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Responsive.height(16)),
                Container(
                  //  margin: EdgeInsets.symmetric(horizontal: Responsive.width(16)),
                  decoration: BoxDecoration(
                    color: AppColors.backgoundlightblue,
                    borderRadius: BorderRadius.circular(16),

                    // border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                    
                      ProfileMenuItem(title: "Notification", icon: Icons.notifications),

                      ProfileMenuItem(
                        title: "My data",
                        icon: Icons.assessment_outlined,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Responsive.height(16)),

                Text(
                  "Terms and Conditions",

                  style: GoogleFonts.openSans(
                    color: AppColors.darktextblue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: Responsive.height(16)),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.backgoundlightblue,
                    borderRadius: BorderRadius.circular(16),

                    // border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    children: [
                      ProfileMenuItem(
                        title: "Downloads",
                        icon: Icons.cloud_download,
                      ),
                      ProfileMenuItem(
                        title: "Accessibility",
                        icon: Icons.access_time,
                      ),
                        ProfileMenuItem(
                        title: "Language",
                        icon: Icons.language,
                      ),

                      ProfileMenuItem(
                        title: "Log out",
                        icon: Icons.logout,
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
