import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:my_trial_first_app/Models/product_model.dart';
import 'package:my_trial_first_app/dio_client/dio_client.dart';


class ProductSearchController extends GetxController{
  final ApiService _apiService = ApiService();

  var isLoading = false.obs;

  var products =<ProductModel>[].obs;


  Future<void> searchProducts(String title) async{
    if (isLoading.value){
      return;
    }
    try {
      isLoading.value = true;
      final result = await _apiService.getProductsByTitle(title: title); 
      products.value = result;
    } catch (e) {
      log("Error searching products: $e");
    } finally {
      isLoading.value = false;
    }

  }
}