import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Enter your password',

                prefixIcon: Icon(Icons.password),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.lightBlue, width: 2),
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
            Row(
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
                    onPressed: () {}, //what happens when the button is clicked
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 15),
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
            //  Row(
            //   children: [
            //     Expanded(child: ElevatedButton(  //A clickable button with elevation
            //   style: ElevatedButton.styleFrom(
            //   backgroundColor: Colors.lightBlue ,
            //   shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.circular(5)
            //   )
            //   ),
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/signup');
            //   },  //what happens when the button is clicked
            //   child: Text("Register",  style: TextStyle(color: Colors.white , fontSize: 15)),
            // ),)
            //   ],
            //  ),
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
