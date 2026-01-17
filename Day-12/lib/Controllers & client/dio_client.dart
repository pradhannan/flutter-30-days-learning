import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:my_trial_first_app/Models/product_model.dart';
import 'package:my_trial_first_app/get_storage.dart';

class ApiService {
  late final Dio dio;
  ApiService() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://api.escuelajs.co/api/v1/",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        sendTimeout: const Duration(seconds: 10),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final accessToken = TokenStorage.getAccessToken;

          if (accessToken != null) {
            options.headers['Authorization'] = 'Bearer $accessToken';
          }

          handler.next(options);
        },

        onResponse: (response ,handler){
          log( "the response is ${response.data}");

          handler.next(response);

        }
      ),
    );
  }


//Creating new user
  Future<void> createUser(UserModel model) async {
    try {
      await dio.post("users", data: model.toMap());
    } on DioException catch (e) {
      log("error is :${e.response?.statusCode}");
    }
  }


//login user
  Future<dynamic> loginUser(LoginModel model) async {
    try {
      final response = await dio.post("auth/login", data: model.toMap());
      final data = response.data;
      return data;
    } on DioException catch (e) {
      throw Exception("Login Error  ${e.toString()}");
    }
  }


//products
  Future<List<ProductModel>> getProduct() async{
    final response = await dio.get('products');
    final data = (response.data as List).map((e)=>ProductModel.fromJson(e)).toList();
    return data;

  }

  //products by id
  Future<ProductModel> getProductById(int id) async{
    final response = await dio.get('products/$id');
    final data = ProductModel.fromJson(response.data);
    return data;

  }

}
