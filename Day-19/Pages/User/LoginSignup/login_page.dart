import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Controllers/User/login_controller.dart';
import 'package:get/get.dart';
import 'package:my_trial_first_app/routes/app_routes.dart';
import 'package:my_trial_first_app/Theme/app_color.dart';
import 'package:my_trial_first_app/widgets/Textfield/custom_passwordfield.dart';
import 'package:my_trial_first_app/widgets/Textfield/custom_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController loginController = Get.put(LoginController());

  var isPasswordHidden = true.obs; // true = password hidden

  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  void dispose() {
    emailCtrl.dispose();
    passwordCtrl.dispose();

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
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 25,
            color: AppColors.navyblue,
          ),
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
            ), // space on all sides
            child: Column(
              children: [
                const SizedBox(height: 60),

                Text(
                  "WELCOME BACK !",
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

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                     Get.toNamed(AppRoutes.forgetpassword);
                    }, // Navigate to forgot password screen}
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: AppColors.greyblue,
                        fontSize: 15, // small font
                      ),
                    ),
                  ),
                ),

                CustomTextfield(
                  labelText: "Email",
                  hintText: "Enter your email",
                  controller: emailCtrl,
                  prefixIcon: Icon(Icons.email),
                ),
                SizedBox(height: 20),

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

                SizedBox(height: 20),

                Obx(() {
                  return SizedBox(
                    width: 320,
                    height: 50,
                    child: ElevatedButton(
                      //A clickable button with elevation
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.buttonblue,
                        elevation: 5,

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        if (emailCtrl.text.isEmpty ||
                            passwordCtrl.text.isEmpty) {
                          Get.snackbar(
                            "Error",
                            "Please fill all fields",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.red,
                            colorText: Colors.white,
                          );
                          return;
                        }
                        loginController.loginUsers(
                          useremail: emailCtrl.text,
                          password: passwordCtrl.text,
                        );
                      }, //what happens when the button is clicked
                      child: loginController.isLoading.value == true
                          ? CircularProgressIndicator()
                          : Text(
                              "LOGIN",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
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
                        "Or Login With",
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
                      onTap: () {
                        loginController.LoginWithGoogle();
                      },
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

                SizedBox(height: 30),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account yet? ",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.greyblue,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(AppRoutes.signup);
                        },
                        child: Text(
                          "Signup Now",
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
