import 'package:dartz/dartz.dart';
import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/jint/data/data_source/login_data_source/login_data_source.dart';
import 'package:jint/jint/data/data_source/search_data_source/search_data_source.dart';
import 'package:jint/jint/domain/entities/login.dart';
import 'package:jint/jint/domain/entities/search/search.dart';
import 'package:jint/jint/domain/repositort/base_login_repositort.dart';
import 'package:jint/jint/domain/repositort/base_search_repository.dart';
import 'package:jint/jint/domain/usecase/login_user_usecase/login_user_usecase.dart';
import 'package:jint/jint/domain/usecase/search_use_case/search_use_case.dart';

class SearchRepository extends BaseSearchRepository{
  final BaseSearchDataSource baseSearchDataSource;

  SearchRepository({required this.baseSearchDataSource});

  @override
  Future<Either<Failure, List<Search>>> search(SearchParameters parameters) async{
    final result=await baseSearchDataSource.search(parameters);
    try{
      return Right(result);

    } on ServerException catch(failure){
      return Left(ServerFailure(failure.errorMassageModel.statusMessage));
    }
  }






}