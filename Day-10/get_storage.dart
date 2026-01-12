import 'package:get_storage/get_storage.dart';

class TokenStorage{
  static final GetStorage _box = GetStorage();
  static const String _accessToken ='access-token';

  static void savetoken({required String acessToken}){
    _box.write(_accessToken, acessToken);
  }

  static String? get getAccessToken{
    return _box.read(_accessToken);
  }

  static void clear(){
    _box.remove(_accessToken);
  }
}