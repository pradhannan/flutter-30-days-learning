import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Responsive/responsive.dart';
import 'package:my_trial_first_app/routes/app_routes.dart';
import 'package:my_trial_first_app/widgets/App/app_color.dart';
import 'package:my_trial_first_app/widgets/App/custom_appbar.dart';
import 'package:my_trial_first_app/widgets/App/profileedit.dart';
import 'package:my_trial_first_app/widgets/App/profilemenuitem.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(title: "Profile"),
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
                  "Account",

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
                      ProfileMenuItem(
                        title: "Account Information",
                        icon: Icons.person,
                      ),

                      ProfileMenuItem(
                        title: "Address Management",
                        icon: Icons.location_on,
                      ),
                      ProfileMenuItem(
                        title: "My orders",
                        icon: Icons.shopping_bag,
                      ),
                      ProfileMenuItem(
                        title: "Settings",
                        icon: Icons.settings,
                        onTap: (){Get.toNamed(AppRoutes.settings);}
                      ),

                      ProfileMenuItem(
                        title: "Password Manager",
                        icon: Icons.lock,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Responsive.height(16)),

                Text(
                  "Support",

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
                        title: "Help Center",
                        icon: Icons.question_mark,
                      ),
                      ProfileMenuItem(
                        title: "Log out",
                        icon: Icons.logout_outlined,
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
