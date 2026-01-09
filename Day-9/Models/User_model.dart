import 'dart:convert';

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

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? avatar,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'avatar': avatar,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      avatar: map['avatar'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
