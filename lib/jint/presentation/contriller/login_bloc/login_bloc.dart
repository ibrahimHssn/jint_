import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:jint/core/utils/app_icons.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/usecase/login_user_usecase/login_user_usecase.dart';
import 'package:jint/jint/presentation/contriller/login_bloc/login_state.dart';

import 'login_event.dart';


import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;

  LoginBloc(this.loginUseCase) : super(const LoginState()) {
    on<LoginJintEvent>(_login);
  }

  Future<void> _login(LoginJintEvent event, Emitter<LoginState> emit) async {
    emit(state.copyWith(loginState: RequestState.loading));
    print("1");
    try {
      final result = await loginUseCase(LoginParameters(
        userName: event.userName,
        password: event.password,
      ));
      print("2");

      print("loginState: ${state.loginState}");

      result.fold(
            (l) {
          emit(state.copyWith(
            loginState: RequestState.error,
            loginMessage: l.massage,
          ));
          print("3");

          print("loginState: ${state.loginState}");
        },
            (r) {
          emit(state.copyWith(
            login: r,
            loginState: RequestState.loaded,
          ));
          print("4");

          print("loginState: ${state.loginState}");
        },
      );
    } catch (e) {
      // Handle the exception
      print("An error occurred: $e");
    }
  }
}

