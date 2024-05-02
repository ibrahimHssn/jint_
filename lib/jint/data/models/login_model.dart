import 'package:jint/jint/domain/entities/login.dart';

class LoginModel extends Login {

  const LoginModel(
      {required super.isSuccess, required super.message, required super.object});

  factory LoginModel.fromJson(Map<String, dynamic> json)=>
      LoginModel(
        isSuccess: json['isSuccess'],
        message: json['message'],
        object: json['object'],

      );
}