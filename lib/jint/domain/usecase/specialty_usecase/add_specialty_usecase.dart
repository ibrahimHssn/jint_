import 'package:dartz/dartz.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/domain/entities/specialty/specialty.dart';
import 'package:jint/jint/domain/repositort/base_specialty_repository.dart';
import 'package:jint/jint/domain/usecase/specialty_usecase/specialty_parameters.dart';
class AddSpecialtyUseCase extends BaseUseCase<Specialty,SpecialtyParameters>{
  final BaseSpecialtyRepository baseSpecialtyRepository;

  AddSpecialtyUseCase({required this.baseSpecialtyRepository});

  @override
  Future<Either<Failure, Specialty>> call(SpecialtyParameters parameters)async {
    return await baseSpecialtyRepository.addSpecialty(parameters);
  }
}
