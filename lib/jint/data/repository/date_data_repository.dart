import 'package:dartz/dartz.dart';
import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/jint/data/data_source/date_data_source/date_data_source.dart';
import 'package:jint/jint/domain/entities/date/date.dart';
import 'package:jint/jint/domain/repositort/base_date_repository.dart';
import 'package:jint/jint/domain/usecase/date_use_case/date_parameters.dart';

class DateDataRepository extends BaseDateRepository{
 final BaseDateDataSource baseDateRemoteDataSource;

  DateDataRepository({required this.baseDateRemoteDataSource});

  @override
  Future<Either<Failure, List<Date>>> getDate(DateParameters parameters) async{
    final result=await baseDateRemoteDataSource.getDate(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Date>> updateDate(DateParameters parameters) async{
    final result=await baseDateRemoteDataSource.updateDate(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Date>> addDate(DateParameters parameters) async{
    final result=await baseDateRemoteDataSource.addDate(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Date>> deleteDate(DateParameters parameters) async{
    final result=await baseDateRemoteDataSource.deleteDate(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }
}