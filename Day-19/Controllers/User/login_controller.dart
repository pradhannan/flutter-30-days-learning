import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_trial_first_app/Models/login_model.dart';
import 'package:my_trial_first_app/Navbar/bottom_nav_bar.dart';
import 'package:my_trial_first_app/Storage/get_storage.dart';
import '../../dio_client/dio_client.dart';

class LoginController extends GetxController {
  final ApiService _apiService = ApiService();
  var isLoading = false.obs;

  var name = ''.obs;
  var email = ''.obs;
  var avatar = ''.obs;
  var token = ''.obs;

  Future<void> loginUsers({
    required String useremail,
    required String password,
  }) async {
    try {
      isLoading.value = true;
      final user = LoginModel(email: useremail, password: password);
      final response = await _apiService.loginUser(user);
      // Save token or user data
      // final token = response['access_token'];
      token.value = response['access_token'] ?? '';
      TokenStorage.savetoken(acessToken: token.value);
      
      final userProfile = await _apiService.getProfile();

      log(userProfile['name']);
name.value = userProfile['name'] ?? '';
email.value = userProfile['email'] ?? '';
avatar.value = userProfile['avatar'] ?? '';

// Persist in storage
TokenStorage.setUserName(name.value);
TokenStorage.setUserEmail(email.value);
TokenStorage.setUserAvatar(avatar.value);

     Get.offAll(() => BottomNavBar());

      print("Login response: $response");
      isLoading.value = false;
      Get.snackbar(
        "Success!",
        "Login successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    } catch (e) {
      log("Login failed: $e");
      isLoading.value = false;
      Get.snackbar(
        "Failure!",
        "Login unsuccessful",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    }
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  var isContinueWithGoogleLoading = false.obs;

  Future<void> LoginWithGoogle() async {
    try {
      isContinueWithGoogleLoading.value = true;

      // start google sign in
      final googleSignIn = GoogleSignIn.instance;
      await googleSignIn.initialize();

      // authentication details
      final GoogleSignInAccount? googleUSer = await googleSignIn.authenticate();

      if (googleUSer == null) return; // user cancelled

      if (googleUSer != null) {
        final authDetails = googleUSer.authentication;
        final String? idToken = authDetails.idToken;

        final List<String> Scope = ['email', 'profile'];
        final auth = await googleUSer.authorizationClient.authorizeScopes(
          Scope,
        );

        final String accessToken = auth.accessToken;
        final credentials = GoogleAuthProvider.credential(
          accessToken: accessToken,
          idToken: idToken,
        );
        // Sign in with Firebase
        await _auth.signInWithCredential(credentials);


        // Save user info in reactive variables
        token.value = _auth.currentUser!.uid;
        name.value = _auth.currentUser!.displayName ?? '';
        email.value = _auth.currentUser!.email ?? '';
        avatar.value = _auth.currentUser!.photoURL ?? '';

        // Also persist for app restarts
        TokenStorage.savetoken(acessToken: token.value);
        TokenStorage.setUserName(name.value);
        TokenStorage.setUserEmail(email.value);
        TokenStorage.setUserAvatar(avatar.value);

        // Store UID in your existing TokenStorage

           Get.offAll(() => BottomNavBar());
      }
    } catch (e) {
      log("Login failed: $e");
      isLoading.value = false;
      Get.snackbar(
        "Failure!",
        "Login unsuccessful",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
      );
    } finally {
      isContinueWithGoogleLoading.value = false;
    }
  }
}
