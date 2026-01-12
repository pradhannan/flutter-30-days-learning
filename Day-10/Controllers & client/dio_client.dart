import 'package:dio/dio.dart';
import 'package:my_trial_first_app/Models/User_model.dart';
import 'package:my_trial_first_app/Models/login_model.dart';
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
          print( "the response is ${response.data}");

          handler.next(response);

        }
      ),
    );
  }

  Future<void> createUser(UserModel model) async {
    try {
      await dio.post("users", data: model.toMap());
    } on DioException catch (e) {
      print("error is :${e.response?.statusCode}");
    }
  }

  Future<dynamic> loginUser(LoginModel model) async {
    try {
      final response = await dio.post("auth/login", data: model.toMap());
      final data = response.data;
      return data;
    } on DioException catch (e) {
      throw Exception("Login Error  ${e.toString()}");
    }
  }
}
