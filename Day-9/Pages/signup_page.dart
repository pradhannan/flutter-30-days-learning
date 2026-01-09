import 'package:flutter/material.dart';
import 'package:my_trial_first_app/Controllers & client/signup_controller.dart';
import 'package:get/get.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final UserController userController = Get.put(UserController());

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, size: 20, color: Colors.white),
        ),
        centerTitle: true,
        title: Text("SignUp Page", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue,
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameCtrl,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.lightBlue, width: 2),
                  ),
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                controller: emailCtrl,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.lightBlue, width: 2),
                  ),
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                controller: passwordCtrl,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.lightBlue, width: 2),
                  ),
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                controller: avatarCtrl,
                decoration: InputDecoration(
                  labelText: 'Avatar',
                  hintText: 'Enter your avatar',
                  prefixIcon: Icon(Icons.link),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.lightBlue, width: 2),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        print(
                          "name: $nameCtrl   email: ${emailCtrl.text}   password: ${passwordCtrl.text} avatar: ${avatarCtrl.text}",
                        ); // to confirm
                        userController.createUsers(
                          name: nameCtrl.text,
                          email: emailCtrl.text,
                          password: passwordCtrl.text,
                          avatar: avatarCtrl.text,
                        );
                      },
                      child: Text(
                        "Signup",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(child: Divider(thickness: 2)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "Or Signup with",
                      style: TextStyle(fontSize: 15),
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
                      "Already have an account? ",
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text(
                        "Login now",
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
      ),
    );
  }
}
