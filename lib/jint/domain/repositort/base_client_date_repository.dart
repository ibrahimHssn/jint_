import 'package:dartz/dartz.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/jint/domain/entities/client_date/client_date.dart';
import 'package:jint/jint/domain/usecase/client_date_use_case/client_date_parameters.dart';

abstract class BaseClientDateRepository{

  Future<Either<Failure,List<ClientDate>>> getClientDate(ClientDateParameters parameters);
  Future<Either<Failure,List<ClientDate>>> getClientGetAllByDate(ClientDateParameters parameters);
  Future<Either<Failure,List<ClientDate>>> getAllRecived(ClientDateParameters parameters);
  Future<Either<Failure,List<ClientDate>>> getAllSended(ClientDateParameters parameters);
  Future<Either<Failure,ClientDate>> registerClientDate(ClientDateParameters parameters);
  Future<Either<Failure,ClientDate>> updateClientDate(ClientDateParameters parameters);
  Future<Either<Failure,ClientDate>> reActionClientDate(ClientDateParameters parameters);
  Future<Either<Failure,ClientDate>> deleteClientDate(ClientDateParameters parameters);



}