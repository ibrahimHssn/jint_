import 'package:dartz/dartz.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/domain/entities/login.dart';
import 'package:jint/jint/domain/usecase/login_user_usecase/login_user_usecase.dart';

abstract class BaseLoginRepository{


  Future<Either<Failure,Login>> userLogin(LoginParameters parameters);


}