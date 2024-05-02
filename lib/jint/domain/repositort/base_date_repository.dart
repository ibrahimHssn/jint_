import 'package:jint/core/error/failure.dart';
import 'package:jint/jint/domain/entities/date/date.dart';
import 'package:dartz/dartz.dart';
import 'package:jint/jint/domain/usecase/date_use_case/date_parameters.dart';

abstract class BaseDateRepository{
  Future<Either<Failure,List<Date>>>getDate(DateParameters parameters);
  Future<Either<Failure,Date>>addDate(DateParameters parameters);
  Future<Either<Failure,Date>>updateDate(DateParameters parameters);
  Future<Either<Failure,Date>>deleteDate(DateParameters parameters);

}