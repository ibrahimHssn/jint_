import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/network/api_constance.dart';
import 'package:jint/core/network/api_service.dart';
import 'package:jint/core/network/error_massage_model.dart';
import 'package:jint/jint/data/models/search_all_model.dart';
import 'package:jint/jint/domain/usecase/search_use_case/search_use_case.dart';

abstract class BaseSearchDataSource{
  Future<List<SearchModel>> search(SearchParameters parameters);

}


class SearchRemoteDataSource implements BaseSearchDataSource{
  @override
  Future<List<SearchModel>> search(SearchParameters parameters) async {
    final searchParametersDataSource = SearchParametersDataSource(
      pageNumber: parameters.pageNumber,
      pageSize: parameters.pageSize,
      query: parameters.query,
    );

    final response = await ApiService.postData(
      baseUrl: ApiConstance.searchClientDatePath,
      data: searchParametersDataSource.toMap(),
    );

    if (response.statusCode == 200) {
      print("search: ${response.data}");
      final List<SearchModel> searchResults = [];

      if (response.data != null) {
        if (response.data['user'] != null && response.data['user']['data'] != null) {
          searchResults.addAll((response.data['user']['data'] as List).map((e) => SearchModel.fromJson(e)));
        }

        if (response.data['specialty_bloc'] != null && response.data['specialty_bloc']['data'] != null) {
          searchResults.addAll((response.data['specialty_bloc']['data'] as List).map((e) => SearchModel.fromJson(e)));
        }
      }

      return searchResults;
    } else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

}



class SearchParametersDataSource extends SearchParameters {
  const SearchParametersDataSource({required super.pageNumber, required super.pageSize, required super.query});



  Map<String, dynamic> toMap() {
    return {
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'query': query.trim(),
    };
  }
}

