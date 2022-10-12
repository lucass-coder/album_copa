// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterModel {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  RegisterModel(this.name, this.email, this.password, this.confirmPassword);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      map['name'] as String,
      map['email'] as String,
      map['password'] as String,
      map['password_confirmation'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) =>
      RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
