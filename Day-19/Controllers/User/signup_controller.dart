import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trial_first_app/Models/User_model.dart';
import 'package:my_trial_first_app/Storage/get_storage.dart';
import '../../dio_client/dio_client.dart';

class UserController extends GetxController{
  final ApiService _apiService = ApiService();
  var isLoading = false.obs;

  Future<void> createUsers (
    {
      required String name,
      required String email,
      required String password,
      required String avatar,
    }
  ) async{
    try{ 
      isLoading.value = true;
      final user = UserModel(
        name: name, 
        email: email, 
        password: password, 
        avatar: avatar,
      );
      await _apiService.createUser(user);
      isLoading.value = false;

      TokenStorage.setUserName(name);
      TokenStorage.setUserEmail(email);
      TokenStorage.setUserAvatar(avatar);

      Get.offAllNamed('/login');
      Get.snackbar("Success!", "User created successfully",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white,
        
      );
    }catch(e){
      isLoading.value = false;
      Get.snackbar("Failure!", "User craetion unsuccessful",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.white
      );
    }
  }
}