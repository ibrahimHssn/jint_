import 'package:equatable/equatable.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/entities/login.dart';

class LoginState extends Equatable {
  final Login? login;
  final RequestState? loginState;
  final String loginMessage;




  const LoginState({
    this.login,
    this.loginState=RequestState.idle ,
    this.loginMessage = "",

  });

  LoginState copyWith({
    Login? login,
    RequestState? loginState,
    String? loginMessage,
  }) {
    return LoginState(
      login: login ?? this.login,
      loginState: loginState ?? this.loginState,
      loginMessage: loginMessage ?? this.loginMessage,

    );
  }

  @override
  List<Object?> get props => [login, loginState, loginMessage];
}


