import 'package:get_storage/get_storage.dart';

class TokenStorage{
  static final GetStorage _box = GetStorage();
  static const String _accessToken ='access-token';
   static const String _userName = 'user-name';
  static const String _userEmail = 'user-email';
  static const String _userAvatar = 'user-avatar';

  static void savetoken({required String acessToken}){
    _box.write(_accessToken, acessToken);
  }

  static String? get getAccessToken{
    return _box.read(_accessToken);
  }

  static void setUserName(String name) => _box.write(_userName, name);
  static void setUserEmail(String email) => _box.write(_userEmail, email);
  static void setUserAvatar(String avatar) => _box.write(_userAvatar, avatar);

  static String? get getUserName => _box.read(_userName);
  static String? get getUserEmail => _box.read(_userEmail);
  static String? get getUserAvatar => _box.read(_userAvatar);

  static void clearUser() {
    _box.remove(_userName);
    _box.remove(_userEmail);
    _box.remove(_userAvatar);
  }
  static void clear(){
    _box.remove(_accessToken);
  }
}