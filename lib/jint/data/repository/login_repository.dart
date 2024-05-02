import 'package:dartz/dartz.dart';
import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/jint/data/data_source/login_data_source/login_data_source.dart';
import 'package:jint/jint/domain/entities/login.dart';
import 'package:jint/jint/domain/repositort/base_login_repositort.dart';
import 'package:jint/jint/domain/usecase/login_user_usecase/login_user_usecase.dart';

class LoginRepository extends BaseLoginRepository{
  final BaseLoginDataSource baseLoginDataSource;

  LoginRepository({required this.baseLoginDataSource});

  @override
  Future<Either<Failure, Login>> userLogin(LoginParameters parameters) async{
    try{
    final result=await baseLoginDataSource.login(parameters);
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    } catch (e) {
      return Left(ServerFailure('Error occurred: $e'));
    }
  }




}