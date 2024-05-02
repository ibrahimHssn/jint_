import 'package:dartz/dartz.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/jint/domain/entities/search/search.dart';
import 'package:jint/jint/domain/usecase/search_use_case/search_use_case.dart';
abstract class BaseSearchRepository{
  Future<Either<Failure,List<Search>>> search(SearchParameters parameters);

}