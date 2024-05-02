import 'package:dartz/dartz.dart';
import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/jint/data/data_source/account_rgistration_data_source/account_rgistration_data_source.dart';
import 'package:jint/jint/domain/entities/user/user.dart';
import 'package:jint/jint/domain/repositort/base_account_rgistration_repository.dart';
import 'package:jint/jint/domain/usecase/account_rgistration_use_case/account_rgistration_usecase.dart';

class AccountRgistrationRepository extends BaseAccountRgistrationRepository{
  final BaseAccountRgistrationDataSource baseAccountRgistrationDataSource;

  AccountRgistrationRepository({required this.baseAccountRgistrationDataSource});

  @override
  Future<Either<Failure, User>> accountRgistration(AccountRgistrationParameters parameters) async{
    final result=await baseAccountRgistrationDataSource.accountRgistration(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }






}