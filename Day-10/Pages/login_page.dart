import 'package:flutter/material.dart';
import 'package:my_trial_first_app/Controllers%20&%20client/login_controller.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login Page', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16), // space on all sides
        child: Column(
          children: [
            SizedBox(height: 10),
            TextFormField(
              controller: emailCtrl,
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.email),
                border: OutlineInputBorder(), //Adds a border around text field
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.lightBlue, width: 2),
                ),
              ),
            ),
            SizedBox(height: 20),

            SizedBox(height: 10),
            Obx(
              () => TextFormField(
                controller: passwordCtrl,
                obscureText: isPasswordHidden.value,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () =>
                        isPasswordHidden.value = !isPasswordHidden.value,
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.lightBlue, width: 2),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {}, // Navigate to forgot password screen}
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 12, // small font
                  ),
                ),
              ),
            ),

            Obx(() {
              return Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      //A clickable button with elevation
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
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
                          email: emailCtrl.text,
                          password: passwordCtrl.text,
                        );
                      }, //what happens when the button is clicked
                      child: loginController.isLoading.value == true
                          ? CircularProgressIndicator()
                          : Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                    ),
                  ),
                ],
              );
            }),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: Divider(thickness: 2)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text("Or Login with", style: TextStyle(fontSize: 15)),
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
                  borderRadius: BorderRadius.circular(30),
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(
                      Icons.g_mobiledata,
                      color: Colors.red,
                      size: 34,
                    ),
                  ),
                ),
                SizedBox(width: 16),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(30),
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.facebook, color: Colors.blue, size: 34),
                  ),
                ),
                SizedBox(width: 16),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(30),
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(Icons.apple, color: Colors.black, size: 34),
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
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/signup');
                    },
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.lightBlue,
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
    );
  }
}
