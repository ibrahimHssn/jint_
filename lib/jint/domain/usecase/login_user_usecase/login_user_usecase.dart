import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/domain/entities/login.dart';
import 'package:jint/jint/domain/repositort/base_login_repositort.dart';

class LoginUseCase extends BaseUseCase<Login,LoginParameters>{
   final BaseLoginRepository baseLoginRepository;

  LoginUseCase({required this.baseLoginRepository});
  @override
  Future<Either<Failure, Login>> call(LoginParameters parameters) async{
   return await baseLoginRepository.userLogin(parameters);
  }



}


class LoginParameters extends Equatable {
  final String userName;
  final String password;

  const LoginParameters({required this.userName, required this.password});

  @override
  List<Object> get props => [userName, password];
}