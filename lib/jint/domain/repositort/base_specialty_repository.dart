import 'package:jint/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:jint/jint/domain/entities/specialty/specialty.dart';
import 'package:jint/jint/domain/usecase/specialty_usecase/specialty_parameters.dart';

abstract class BaseSpecialtyRepository{

  Future<Either<Failure,List<Specialty>>>specialty(SpecialtyParameters parameters);
  Future<Either<Failure,Specialty>>addSpecialty(SpecialtyParameters parameters);
  Future<Either<Failure,Specialty>>updateSpecialty(SpecialtyParameters parameters);
  Future<Either<Failure,Specialty>>deleteSpecialty(SpecialtyParameters parameters);

}