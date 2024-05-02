import 'package:dartz/dartz.dart';
import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/jint/data/data_source/client_date_data_source/client_date_data_source.dart';
import 'package:jint/jint/domain/entities/client_date/client_date.dart';
import 'package:jint/jint/domain/repositort/base_client_date_repository.dart';
import 'package:jint/jint/domain/usecase/client_date_use_case/client_date_parameters.dart';

class ClientDateRepository extends BaseClientDateRepository{
 final BaseClientDateDataSource baseClientDateDataSource;

  ClientDateRepository({required this.baseClientDateDataSource});
  @override
  Future<Either<Failure, ClientDate>> deleteClientDate(ClientDateParameters parameters) async{
    final result=await baseClientDateDataSource.deleteClientDate(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ClientDate>>> getAllRecived(ClientDateParameters parameters) async{
    final result=await baseClientDateDataSource.getAllRecived(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ClientDate>>> getAllSended(ClientDateParameters parameters) async{
    final result=await baseClientDateDataSource.getAllSended(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ClientDate>>> getClientDate(ClientDateParameters parameters) async{
    final result=await baseClientDateDataSource.getClientDate(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<ClientDate>>> getClientGetAllByDate(ClientDateParameters parameters) async{
    final result=await baseClientDateDataSource.getClientGetAllByDate(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ClientDate>> reActionClientDate(ClientDateParameters parameters) async{
    final result=await baseClientDateDataSource.reActionClientDate(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ClientDate>> registerClientDate(ClientDateParameters parameters) async{
    final result=await baseClientDateDataSource.registerClientDate(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, ClientDate>> updateClientDate(ClientDateParameters parameters) async{
    final result=await baseClientDateDataSource.updateClientDate(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

}