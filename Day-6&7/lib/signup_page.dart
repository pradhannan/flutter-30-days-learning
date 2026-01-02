import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
           Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, size: 20, color: Colors.white,),),
        centerTitle: true,
        title: const Text('SignUp Page', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.lightBlue,
      ),
      body:   Padding(
    padding: EdgeInsets.all(16), // space on all sides
    child:
      Column(children: [
      Text("Name:"),
      SizedBox(height: 10),
      TextField(
              decoration: InputDecoration(
              labelText: 'Name',
              hintText: 'Enter your name',
              prefixIcon: Icon(Icons.person),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.lightBlue, width: 2)
              ),  //Adds a border around text field
      )),
      SizedBox(height: 10),
      Text("Email:"),
      SizedBox(height: 10),
      TextField(
              decoration: InputDecoration(
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(), 
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.lightBlue, width: 2)
              ), //Adds a border around text field
      )),
      SizedBox(height: 10),
      Text("Password:"),
      SizedBox(height: 10),
      TextField(
              obscureText: true,
              decoration: InputDecoration(
              labelText: 'Password',
              
              hintText: 'Enter your password',
              prefixIcon: Icon(Icons.password),
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.lightBlue, width: 2)
              ),
              
        )),
      SizedBox(height: 20),
      Row(
        children: [
          Expanded(child: 
          ElevatedButton(  
            style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5), )
            ), //A clickable button with elevation
            onPressed: () {},  //what happens when the button is clicked
            child: Text("Signup", style: TextStyle(color: Colors.white),),
          ),),
        ],
      ),  
      SizedBox(height: 10),
      Row(
        children: [
          Expanded(child: Divider(thickness: 2,)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("Or Signup with", style: TextStyle(fontSize: 15),),
          ),
          Expanded(child: Divider(thickness: 2,))
        ],
      ), 
      SizedBox(height: 10), 
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
      //     Expanded(child: ElevatedButton(  //A clickable button with elevation
      //   style: ElevatedButton.styleFrom(
      //   backgroundColor: Colors.lightBlue,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(5)
      //   )
      //   ),
      //   onPressed: () {},  //what happens when the button is clicked
      //   child: Text("Login now", style: TextStyle(color: Colors.white),),
      // ),)
      InkWell(
        onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: CircleAvatar(
        radius: 34,
        backgroundColor: Colors.grey.shade200,
        child: Icon(Icons.g_mobiledata, color: Colors.red, size: 34),
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
          ], ),),
      
    ]
    )) 
    );
  }
}