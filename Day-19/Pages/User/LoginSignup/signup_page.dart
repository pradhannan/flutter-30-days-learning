import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Controllers/User/signup_controller.dart';
import 'package:get/get.dart';
import 'package:my_trial_first_app/routes/app_routes.dart';
import 'package:my_trial_first_app/Theme/app_color.dart';
import 'package:my_trial_first_app/widgets/Textfield/custom_passwordfield.dart';
import 'package:my_trial_first_app/widgets/Textfield/custom_textfield.dart';


class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final UserController userController = Get.put(UserController());

  var isPasswordHidden = true.obs;

  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final avatarCtrl = TextEditingController();

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    passwordCtrl.dispose();
    avatarCtrl.dispose();

    super.dispose(); //always declared below
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
child: Icon(Icons.arrow_back_ios_new, size: 25, color: AppColors.navyblue),
        
        ),
      
      ),

      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
           padding: const EdgeInsets.fromLTRB(
              40,
              0,
              40,
              0,
            ), 
            child: Column(
              children: [

                const SizedBox(height: 10),

                 Text(
                  "CREATE ACCOUNT :)",
                  style: GoogleFonts.poppins(
                    color: AppColors.darktextblue,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 30),

                CircleAvatar(
                  radius: 40, // small circle
                  backgroundColor: AppColors.backgoundlightblue,
                  child: ClipOval(
                    child: FractionallySizedBox(
                      widthFactor: 1.6, // scales the image bigger than circle
                      heightFactor: 1.6,
                      child: Image.asset("assets/logo.png", fit: BoxFit.cover),
                    ),
                  ),
                ),

                  SizedBox(height: 20),

                
                CustomTextfield(
                  labelText: "Name",
                  hintText: "Enter your Name",
                  controller: nameCtrl,
                  prefixIcon: Icon(Icons.person),
                ),
        
                SizedBox(height: 10),
        
                
                CustomTextfield(
                  labelText: "Email",
                  hintText: "Enter your email",
                  controller: emailCtrl,
                  prefixIcon: Icon(Icons.email),
                ),
        
                SizedBox(height: 10),
        
                 Obx(
                  () => CustomPasswordfield(
                    labelText: "Password",
                    hintText: "Enter your password",
                    controller: passwordCtrl,
                    prefixIcon: Icon(Icons.password),
                    obscureText: isPasswordHidden.value,
                   
                    onPressed: () =>
                        isPasswordHidden.value = !isPasswordHidden.value,
                  ),
                ),

        
                SizedBox(height: 10),
        
                
                CustomTextfield(
                  labelText: "Avatar",
                  hintText: "Enter your avatar",
                  controller: avatarCtrl,
                  prefixIcon: Icon(Icons.link),
                ),
                SizedBox(height: 20),
        
                Obx(() {
                  return SizedBox(
                     width: 320,
                    height: 50,
                    
                        child: ElevatedButton(
                          style:  ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonblue,
                        elevation: 5,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                          onPressed: () {
                            if (emailCtrl.text.isEmpty ||
                                passwordCtrl.text.isEmpty ||
                                nameCtrl.text.isEmpty) {
                              Get.snackbar(
                                "Error",
                                "Please fill all fields",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                              return; // Stop execution if fields are empty
                            }
                            log(
                              "name: ${nameCtrl.text}   email: ${emailCtrl.text}   password: ${passwordCtrl.text} avatar: ${avatarCtrl.text}",
                            ); // to confirm
                            userController.createUsers(
                              name: nameCtrl.text,
                              email: emailCtrl.text,
                              password: passwordCtrl.text,
                              avatar: avatarCtrl.text,
                            );
                          },
                          child: userController.isLoading.value == true
                              ? CircularProgressIndicator()
                              : Text(
                                  "Signup",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      
                  );
                }),
        
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: Divider(thickness: 2)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Or Signup With",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Expanded(child: Divider(thickness: 2)),
                  ],
                ),
        
                SizedBox(height: 10),
         Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(2), // thickness of border
                        decoration: BoxDecoration(
                          color: AppColors.buttonblue, // border color
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 20, // your small circle
                          backgroundColor: Colors.white, // inner background
                          child: FaIcon(
                            FontAwesomeIcons.google,
                            color: AppColors.darktextblue,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    InkWell(
                      onTap: () {},

                      child: Container(
                        padding: EdgeInsets.all(2), // thickness of border
                        decoration: BoxDecoration(
                          color: AppColors.buttonblue, // border color
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 20, // your small circle
                          backgroundColor: Colors.white, // inner background
                          child: FaIcon(
                            FontAwesomeIcons.facebookF,
                            color: AppColors.darktextblue,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    InkWell(
                      onTap: () {},

                      child: Container(
                        padding: EdgeInsets.all(2), // thickness of border
                        decoration: BoxDecoration(
                          color: AppColors.buttonblue, // border color
                          shape: BoxShape.circle,
                        ),
                        child: CircleAvatar(
                          radius: 20, // your small circle
                          backgroundColor: Colors.white, // inner background
                          child: FaIcon(
                            FontAwesomeIcons.apple,
                            color: AppColors.darktextblue,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
        
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(fontSize: 16, color: AppColors.greyblue),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.login);
                        },
                        child: Text(
                          "Login Now",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.textblue,
                            
                            fontSize: 16,
                            color: AppColors.textblue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
