import 'package:dartz/dartz.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/jint/domain/entities/date_details/date_details.dart';
import 'package:jint/jint/domain/usecase/date_details_use_case/date_details_parameters.dart';

abstract class BaseDateDetailsRepository{
  Future<Either<Failure,List<DateDetails>>> getDateDetails(DateDetailsParameters parameters);
  Future<Either<Failure,DateDetails>> addDateDetails(DateDetailsParameters parameters);
  Future<Either<Failure,DateDetails>> updateDateDetails(DateDetailsParameters parameters);
  Future<Either<Failure,DateDetails>> deleteDateDetails(DateDetailsParameters parameters);

}

