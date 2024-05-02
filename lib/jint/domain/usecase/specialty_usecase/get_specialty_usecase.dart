import 'package:dartz/dartz.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/domain/entities/specialty/specialty.dart';
import 'package:jint/jint/domain/repositort/base_specialty_repository.dart';
import 'package:jint/jint/domain/usecase/specialty_usecase/specialty_parameters.dart';
class GetSpecialtyUseCase extends BaseUseCase<List<Specialty>,SpecialtyParameters>{
  final BaseSpecialtyRepository baseSpecialtyRepository;

  GetSpecialtyUseCase({required this.baseSpecialtyRepository});

  @override
  Future<Either<Failure, List<Specialty>>> call(SpecialtyParameters parameters)async {
    return await baseSpecialtyRepository.specialty(parameters);
  }
}
