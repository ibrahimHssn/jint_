import 'package:dartz/dartz.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/domain/entities/user/user.dart';
import 'package:jint/jint/domain/repositort/base_user_data_repositort.dart.dart';
import 'package:equatable/equatable.dart';

class GetUserUseCase extends BaseUseCase<User, GetUserParameters> {
  final BaseUserDataRepository baseUserDataRepository;

  GetUserUseCase({required this.baseUserDataRepository});

  @override
  Future<Either<Failure, User>> call(GetUserParameters parameters) async {
    return await baseUserDataRepository.getUserData(parameters);
  }


}


class GetUserParameters extends Equatable {
  final String id;

  const GetUserParameters({required this.id});

  @override
  List<Object> get props => [id];

}
