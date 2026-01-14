import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trial_first_app/Controllers & client/signup_controller.dart';
import 'package:get/get.dart';
import 'package:my_trial_first_app/config/app_color.dart';


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
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
child: Icon(Icons.arrow_back_ios_new, size: 25, color: Colors.black),
        
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

                TextFormField(
                  controller: nameCtrl,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your name',
                    
                     filled: true,
                    fillColor: AppColors.backgoundlightblue,
                    labelStyle: TextStyle(color: AppColors.greyblue),
                    hintStyle: TextStyle(color: AppColors.greyblue),
                    prefixIcon: Icon(Icons.person, color: AppColors.greyblue),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 172, 204, 255),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ), //Adds a border around text field
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: AppColors.buttonblue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
        
                SizedBox(height: 10),
        
                TextFormField(  
                  controller: emailCtrl,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    labelStyle: TextStyle(color: AppColors.greyblue),
                    hintStyle: TextStyle(color: AppColors.greyblue),
                    prefixIcon: Icon(Icons.email, color: AppColors.greyblue),
                    filled: true,
                    fillColor: AppColors.backgoundlightblue,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 172, 204, 255),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ), //Adds a border around text field
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: AppColors.buttonblue,
                        width: 2,
                      ),
                    ),
                  ),
                ),
        
                SizedBox(height: 10),
        
                Obx(
                  () => TextFormField(
                    controller: passwordCtrl,
                    obscureText: isPasswordHidden.value,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      labelStyle: TextStyle(color: AppColors.greyblue),
                    hintStyle: TextStyle(color: AppColors.greyblue),
                    prefixIcon: Icon(Icons.password, color: AppColors.greyblue),
                     suffixIconColor: AppColors.greyblue,
                      suffixIcon: IconButton(
                        icon: Icon(
                          isPasswordHidden.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () =>
                            isPasswordHidden.value = !isPasswordHidden.value,
                      ),
                       filled: true,
                    fillColor: AppColors.backgoundlightblue,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 172, 204, 255),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ), //Adds a border around text field
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: AppColors.buttonblue,
                        width: 2,
                      ),
                    ),
                    ),
                  ),
                ),
        
                SizedBox(height: 10),
        
                TextFormField(
                  controller: avatarCtrl,
                  decoration: InputDecoration(
                    labelText: 'Avatar',
                    hintText: 'Enter your avatar',
                   labelStyle: TextStyle(color: AppColors.greyblue),
                    hintStyle: TextStyle(color: AppColors.greyblue),
                    prefixIcon: Icon(Icons.link, color: AppColors.greyblue),
                     filled: true,
                    fillColor: AppColors.backgoundlightblue,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color.fromARGB(255, 172, 204, 255),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ), //Adds a border around text field
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: AppColors.buttonblue,
                        width: 2,
                      ),
                    ),
                  ),
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
                            print(
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
                          Navigator.pushNamed(context, '/login');
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
