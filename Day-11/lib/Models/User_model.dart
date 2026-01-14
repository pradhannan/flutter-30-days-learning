// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names

class UserModel {
  final String name;
  final String email;
  final String password;
  final String avatar;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.avatar,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar,
    };
  }
}
