import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/domain/entities/search/search.dart';
import 'package:jint/jint/domain/repositort/base_search_repository.dart';

class SearchUseCase extends BaseUseCase<List<Search>,SearchParameters>{
  final BaseSearchRepository baseSearchRepository;

  SearchUseCase({required this.baseSearchRepository});

  @override
  Future<Either<Failure, List<Search>>> call(SearchParameters parameters) async{
    return await baseSearchRepository.search(parameters);

  }

}


class SearchParameters extends Equatable {
  final int pageNumber;
  final int pageSize;
  final String query;

  const SearchParameters(
      {required this.pageNumber, required this.pageSize, required this.query});


  @override
  List<Object> get props => [pageNumber, pageSize, query];

}
