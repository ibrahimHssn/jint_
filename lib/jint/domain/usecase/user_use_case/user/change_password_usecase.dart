import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/domain/repositort/base_user_data_repositort.dart.dart';
class ChangePasswordUseCase extends BaseUseCase<NoParameters,ChangePasswordParameters>{
  final BaseUserDataRepository baseUserDataRepository;

  ChangePasswordUseCase({required this.baseUserDataRepository});

  @override
  Future<Either<Failure, NoParameters>> call(ChangePasswordParameters parameters) async{
    return await baseUserDataRepository.changePasswordUserData(parameters);

  }

}


class ChangePasswordParameters extends Equatable {
  final String currentPassword;
  final String newPassword;

  const ChangePasswordParameters(
      {required this.currentPassword, required this.newPassword});

  @override
  List<Object> get props => [currentPassword, newPassword];
}