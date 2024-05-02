import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/domain/entities/user/user.dart';
import 'package:jint/jint/domain/repositort/base_account_rgistration_repository.dart';
class AccountRgistrationUseCase extends BaseUseCase<User,AccountRgistrationParameters>{
  final BaseAccountRgistrationRepository accountRgistrationRepository;

  AccountRgistrationUseCase({required this.accountRgistrationRepository});

  @override
  Future<Either<Failure, User>> call(AccountRgistrationParameters parameters) async{
    return await accountRgistrationRepository.accountRgistration(parameters);

  }

}

class AccountRgistrationParameters extends Equatable {
  final String name;
  final String userName;
  final String? email;
  final String phoneNumber;
  final String password;

  const AccountRgistrationParameters(
      {required this.name, required this.userName,  this.email, required this.phoneNumber, required this.password});


  @override
  List<Object?> get props => [name, userName, email, phoneNumber, password];


}