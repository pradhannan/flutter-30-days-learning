import 'package:dio/dio.dart';
import 'package:my_trial_first_app/Models/User_model.dart';

class ApiService{
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://api.escuelajs.co/api/v1/"
    ),
  );

  Future<void>createUser(UserModel model) async{
    try{
      
      
      final response = dio.post(
        "users",
        data: model.toMap(),
      );
      

    }on DioException catch (e) {
      
      print("error is :${e.response?.statusCode}");
    }
  } 

}