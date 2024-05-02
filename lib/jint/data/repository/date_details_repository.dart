import 'package:dartz/dartz.dart';
import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/jint/data/data_source/account_rgistration_data_source/account_rgistration_data_source.dart';
import 'package:jint/jint/data/data_source/date_details_data_source/date_details_data_source.dart';
import 'package:jint/jint/domain/entities/date_details/date_details.dart';
import 'package:jint/jint/domain/entities/user/user.dart';
import 'package:jint/jint/domain/repositort/base_account_rgistration_repository.dart';
import 'package:jint/jint/domain/repositort/base_date_details_repositort.dart';
import 'package:jint/jint/domain/usecase/date_details_use_case/date_details_parameters.dart';

class DateDetailsRepository extends BaseDateDetailsRepository{
  final BaseDateDetailsDataSource baseDateDetailsDataSource;

  DateDetailsRepository({required this.baseDateDetailsDataSource});

  @override
  Future<Either<Failure, DateDetails>> addDateDetails(DateDetailsParameters parameters) async{
    final result=await baseDateDetailsDataSource.addDateDetails(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, DateDetails>> deleteDateDetails(DateDetailsParameters parameters) async{
    final result=await baseDateDetailsDataSource.deleteDateDetails(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<DateDetails>>> getDateDetails(DateDetailsParameters parameters) async{
    final result=await baseDateDetailsDataSource.getDateDetails(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, DateDetails>> updateDateDetails(DateDetailsParameters parameters) async{
    final result=await baseDateDetailsDataSource.updateDateDetails(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }







}