import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final bool isSuccess;
  final String message;
  final dynamic object;

  const Login(
      {required this.isSuccess, required this.message, required this.object});

  @override
  List<Object> get props => [isSuccess, message, object];

}