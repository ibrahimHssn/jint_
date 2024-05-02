import 'package:dartz/dartz.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/domain/entities/date/date.dart';
import 'package:jint/jint/domain/repositort/base_date_repository.dart';

import 'date_parameters.dart';

class UpdateDateUseCase extends BaseUseCase<Date, DateParameters> {
  final BaseDateRepository baseDateRepository;

  UpdateDateUseCase({required this.baseDateRepository});

  @override
  Future<Either<Failure, Date>> call(DateParameters parameters) async {
    return await baseDateRepository.updateDate(parameters);
  }

}

