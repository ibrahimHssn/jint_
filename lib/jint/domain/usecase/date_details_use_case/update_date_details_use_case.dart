import 'package:dartz/dartz.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/domain/entities/date_details/date_details.dart';
import 'package:jint/jint/domain/repositort/base_date_details_repositort.dart';
import 'package:jint/jint/domain/usecase/date_details_use_case/date_details_parameters.dart';

class UpdateDateDetailsUseCase extends BaseUseCase<DateDetails,DateDetailsParameters>{
  final BaseDateDetailsRepository baseDateDetailsRepository;

  UpdateDateDetailsUseCase({required this.baseDateDetailsRepository});

  @override
  Future<Either<Failure, DateDetails>> call(DateDetailsParameters parameters)async {
    return await baseDateDetailsRepository.updateDateDetails(parameters);

  }



}