import 'package:dartz/dartz.dart';
import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/data/data_source/user_data_source/user_data_source.dart';
import 'package:jint/jint/domain/entities/images.dart';
import 'package:jint/jint/domain/entities/social_accounts.dart';
import 'package:jint/jint/domain/entities/user/user.dart';
import 'package:jint/jint/domain/repositort/base_user_data_repositort.dart.dart';
import 'package:jint/jint/domain/usecase/user_use_case/social_ccounts_usecase/get_social_accounts_parameters.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/change_Profile_img_usecase.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/change_password_usecase.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/get_user_usecase.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/update_user_usecase.dart';



class UserDataRepository extends BaseUserDataRepository {
  final BaseUserDataSource baseUserDataSource;

  UserDataRepository({required this.baseUserDataSource});

  @override
  Future<Either<Failure, User>> getUserData(GetUserParameters parameters) async {
    final result = await baseUserDataSource.getUser(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, User>> updateUserData(UserParameters parameters) async {
    final result = await baseUserDataSource.updateUser(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }


  @override
  Future<Either<Failure, SocialAccounts>> addSocialAccounts(GetSocialAccountsParameters parameters) async{
    final result = await baseUserDataSource.addSocialAccounts(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, SocialAccounts>> deleteSocialAccounts(GetSocialAccountsParameters parameters) async{
    final result = await baseUserDataSource.deleteSocialAccounts(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ProfileImg>> changeProfileUserData(ChangeProfileParameters parameters) async{
    final result = await baseUserDataSource.changeProfileUser(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }

  }

  @override
  Future<Either<Failure, NoParameters>> changePasswordUserData(ChangePasswordParameters parameters) async{
    final result = await baseUserDataSource.changePasswordUser(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }




}
