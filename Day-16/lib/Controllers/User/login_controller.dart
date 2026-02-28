import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_trial_first_app/Models/login_model.dart';
import '../../dio_client/dio_client.dart';

class LoginController extends GetxController{
  final ApiService _apiService = ApiService();
  var isLoading = false.obs;

  Future<void> loginUsers (
    {
      required String email,
      required String password,

    }
  ) async{
    try{ 
      isLoading.value = true;
      final user = LoginModel(

        email: email, 
        password: password, 

      );
      final response = await _apiService.loginUser(user);
      //
       print("Login response: $response");
      isLoading.value = false;
      Get.snackbar("Success!", "Login successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        
      );
    }catch(e){
      log("Login failed: $e");
      isLoading.value = false;
      Get.snackbar("Failure!", "Login unsuccessful",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white
      );
    }
  }

  final FirebaseAuth _auth=FirebaseAuth.instance;
  var isContinueWithGoogleLoading = false.obs;

  Future<void> LoginWithGoogle() async{
    try{
      isContinueWithGoogleLoading.value = true;
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize();
      final GoogleSignInAccount? googleUSer = await googleSignIn.authenticate();
      if(googleUSer!=null){
        final authDetails = googleUSer.authentication;
        final String? idToken = authDetails.idToken;

        final List<String> Scope = ['email','profile'];
        final auth = await googleUSer.authorizationClient.authorizeScopes(Scope,);

        final String accessToken = auth.accessToken;
        final credentials = GoogleAuthProvider.credential(
          accessToken: accessToken,
          idToken: idToken,
        );

        await _auth.signInWithCredential(credentials);
      }
    }catch(e){
      log("Login failed: $e");
      isLoading.value = false;
      Get.snackbar("Failure!", "Login unsuccessful",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white
      );
    }finally{
      isContinueWithGoogleLoading.value = false;
    }
  }
}