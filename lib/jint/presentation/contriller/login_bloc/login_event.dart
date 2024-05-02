import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}


class LoginJintEvent extends LoginEvent {
  final String userName;
  final String password;

  const LoginJintEvent({required this.userName, required this.password});

  @override
  List<Object> get props => [userName, password];
}


