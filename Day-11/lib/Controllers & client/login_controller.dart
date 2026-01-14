import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trial_first_app/Models/login_model.dart';
import 'dio_client.dart';

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
      // print("Login response: $response");
      isLoading.value = false;
      Get.snackbar("Success!", "Login successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        
      );
    }catch(e){
      print("Login failed: $e");
      isLoading.value = false;
      Get.snackbar("Failure!", "Login unsuccessful",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white
      );
    }
  }
}