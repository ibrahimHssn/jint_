import 'package:jint/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:jint/jint/domain/entities/user/user.dart';
import 'package:jint/jint/domain/usecase/account_rgistration_use_case/account_rgistration_usecase.dart';

abstract class BaseAccountRgistrationRepository{
  Future<Either<Failure,User>> accountRgistration(AccountRgistrationParameters parameters);

}