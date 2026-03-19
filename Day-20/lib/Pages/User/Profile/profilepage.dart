import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Controllers/User/login_controller.dart';
import 'package:my_trial_first_app/Responsive/responsive.dart';
import 'package:my_trial_first_app/Storage/get_storage.dart';
import 'package:my_trial_first_app/routes/app_routes.dart';
import 'package:my_trial_first_app/Theme/app_color.dart';
import 'package:my_trial_first_app/widgets/App/AppBar/custom_appbar.dart';
import 'package:my_trial_first_app/widgets/App/Profile/profileedit.dart';
import 'package:my_trial_first_app/widgets/App/Profile/profilemenuitem.dart';
import 'package:my_trial_first_app/widgets/Buttons/custom_primarybutton.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
    final LoginController _loginController = Get.find<LoginController>();
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
                        onTap: ()=> Get.toNamed(AppRoutes.helpcenter),
                      ),
                      ProfileMenuItem(
                        title: "Log out",
                        icon: Icons.logout_outlined,
                        onTap: () {
                          _showLogoutDialog(context, _loginController);
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

void _showLogoutDialog(BuildContext context, LoginController _loginController){
  showDialog(context: context, builder: (context){
    return AlertDialog(
      icon: Icon(Icons.logout),
      backgroundColor: AppColors.backgoundlightblue,
      title: Text("LOG OUT?", style: GoogleFonts.openSans(fontSize:18, fontWeight: FontWeight.bold),),
      content: Text("Are you sure you want to logout?",style: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.normal),),
      actions: [
        
        CustomPrimarybutton(onPressed:()=> Navigator.pop(context), text : "Cancel now"),
        CustomPrimarybutton(text: "LOG OUT", onPressed: (){_loginController.token.value = '';
          _loginController.name.value = '';
          _loginController.email.value = '';
          _loginController.avatar.value = '';
          TokenStorage.clear();
          Get.offAllNamed('/login');} , )
      ],
      actionsAlignment: MainAxisAlignment.spaceBetween,
    );
  });
}
