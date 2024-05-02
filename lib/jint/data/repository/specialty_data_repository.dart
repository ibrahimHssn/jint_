import 'package:dartz/dartz.dart';
import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/jint/data/data_source/specialty_data_source/specialty_data_source.dart';
import 'package:jint/jint/domain/entities/specialty/specialty.dart';
import 'package:jint/jint/domain/repositort/base_specialty_repository.dart';
import 'package:jint/jint/domain/usecase/specialty_usecase/specialty_parameters.dart';


class SpecialtyRepository extends BaseSpecialtyRepository{
  final BaseSpecialtyDataSource baseSpecialtyDataSource;

  SpecialtyRepository({required this.baseSpecialtyDataSource});

  @override
  Future<Either<Failure, List<Specialty>>> specialty(SpecialtyParameters parameters) async{
    final result = await baseSpecialtyDataSource.getSpecialty(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }


  @override
  Future<Either<Failure, Specialty>> addSpecialty(SpecialtyParameters parameters) async{
    final result = await baseSpecialtyDataSource.addSpecialty(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, Specialty>> deleteSpecialty(SpecialtyParameters parameters) async{
    final result = await baseSpecialtyDataSource.deleteSpecialty(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }


  @override
  Future<Either<Failure, Specialty>> updateSpecialty(SpecialtyParameters parameters) async{
    final result = await baseSpecialtyDataSource.updateSpecialty(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }

}