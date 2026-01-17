import 'dart:developer';

import 'package:get/state_manager.dart';
import 'package:my_trial_first_app/Models/product_model.dart';
import 'dio_client.dart';


class ProductController extends GetxController{
  final ApiService _apiService = ApiService();
  var isLoading = false.obs;
  var product=<ProductModel>[].obs;

  var productDescription= Rxn<ProductModel>();
  var isProductDescription = false.obs;

  @override
  void onInit(){
    fetchProducts();
    super.onInit();
  }

  Future<void> fetchProducts() async{
    try{
      print("fetchProducts started"); 
      isLoading(true);
      product.value= await _apiService.getProduct();
    
    
    }catch(e){
      log(e.toString());
       isLoading(false);
    }finally{
       isLoading(false);
    }
  }

  Future<void> fetchProductDetails(int id) async{
    try{
      isProductDescription(true);
      productDescription.value = await _apiService.getProductById(id);
    }catch (e) {
      isProductDescription(false);
      log(e.toString());
    } finally {
      isProductDescription(false);
    }
  }
}

  
