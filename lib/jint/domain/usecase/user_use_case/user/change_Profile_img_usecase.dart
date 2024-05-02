import 'package:dartz/dartz.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/domain/entities/images.dart';
import 'package:jint/jint/domain/repositort/base_user_data_repositort.dart.dart';
import 'package:equatable/equatable.dart';
class ChangeProfileImgUserDataUseCase extends BaseUseCase<ProfileImg,ChangeProfileParameters>{
final BaseUserDataRepository baseUserDataRepository;

  ChangeProfileImgUserDataUseCase({required this.baseUserDataRepository});

  @override
  Future<Either<Failure, ProfileImg>> call(ChangeProfileParameters parameters) async{
  return await baseUserDataRepository.changeProfileUserData(parameters);
  }


}

class ChangeProfileParameters extends Equatable {
  final String url;

  const ChangeProfileParameters({required this.url});

  @override
  List<Object> get props => [url];


}
