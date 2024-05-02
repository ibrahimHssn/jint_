import 'package:dartz/dartz.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/domain/entities/images.dart';
import 'package:jint/jint/domain/entities/social_accounts.dart';
import 'package:jint/jint/domain/entities/user/user.dart';
import 'package:jint/jint/domain/usecase/user_use_case/social_ccounts_usecase/get_social_accounts_parameters.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/change_Profile_img_usecase.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/change_password_usecase.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/get_user_usecase.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/update_user_usecase.dart';


abstract class BaseUserDataRepository{

  Future<Either<Failure,User>> getUserData(GetUserParameters parameters);
  Future<Either<Failure,User>> updateUserData(UserParameters parameters);
  Future<Either<Failure,ProfileImg>> changeProfileUserData(ChangeProfileParameters parameters);
  Future<Either<Failure,NoParameters>> changePasswordUserData(ChangePasswordParameters parameters);

  Future<Either<Failure,SocialAccounts>>addSocialAccounts(GetSocialAccountsParameters parameters);
  Future<Either<Failure,SocialAccounts>>deleteSocialAccounts(GetSocialAccountsParameters parameters);





}