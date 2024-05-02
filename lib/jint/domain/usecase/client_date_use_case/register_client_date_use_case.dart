import 'package:dartz/dartz.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/domain/entities/client_date/client_date.dart';
import 'package:jint/jint/domain/repositort/base_client_date_repository.dart';

import 'client_date_parameters.dart';


class RegisterClientDateUseCase extends BaseUseCase<ClientDate,ClientDateParameters>{
  final  BaseClientDateRepository baseClientDateRepository;

  RegisterClientDateUseCase({required this.baseClientDateRepository});

  @override
  Future<Either<Failure, ClientDate>> call(ClientDateParameters parameters) async{
      return await baseClientDateRepository.registerClientDate(parameters);

  }

}