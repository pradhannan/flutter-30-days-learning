import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Controllers/User/login_controller.dart';
import 'package:my_trial_first_app/Responsive/responsive.dart';
import 'package:my_trial_first_app/Storage/get_storage.dart';
import 'package:my_trial_first_app/Theme/app_color.dart';
import 'package:my_trial_first_app/widgets/App/AppBar/custom_appbar.dart';
import 'package:my_trial_first_app/widgets/App/Profile/profileedit.dart';
import 'package:my_trial_first_app/widgets/App/Profile/profilemenuitem.dart';

class Setttingpage extends StatefulWidget {
  const Setttingpage({super.key});

  @override
  State<Setttingpage> createState() => _SetttingpageState();
}

class _SetttingpageState extends State<Setttingpage> {
    final LoginController _loginController = Get.find<LoginController>();

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
                Obx(()=>
                   Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.backgoundlightblue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  
                    child: Profileedit(
                      title:  _loginController.name.value.isEmpty
                            ? 'Guest'
                            : _loginController.name.value,
                      subtitle: _loginController.email.value.isEmpty
                            ? 'No email'
                            : _loginController.email.value,
                            
                    ),
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
                        onTap: () {
                          _loginController.token.value = '';
          _loginController.name.value = '';
          _loginController.email.value = '';
          _loginController.avatar.value = '';
          TokenStorage.clear();
          Get.offAllNamed('/login');
                          
                        },
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
