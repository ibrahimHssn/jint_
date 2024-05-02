import 'package:dartz/dartz.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/domain/entities/social_accounts.dart';
import 'package:jint/jint/domain/repositort/base_user_data_repositort.dart.dart';

import 'get_social_accounts_parameters.dart';

class DeleteSocialAccountsUseCase extends BaseUseCase<SocialAccounts,GetSocialAccountsParameters>{
  final BaseUserDataRepository baseUserDataRepository;
  DeleteSocialAccountsUseCase({required this.baseUserDataRepository});

  @override
  Future<Either<Failure, SocialAccounts>> call(GetSocialAccountsParameters parameters) async{
    return await baseUserDataRepository.deleteSocialAccounts(parameters);
  }




}



