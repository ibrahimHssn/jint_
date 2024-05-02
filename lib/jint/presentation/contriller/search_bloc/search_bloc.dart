import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/usecase/search_use_case/search_use_case.dart';
import 'search_event.dart';
import 'search_state.dart';
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchUseCase searchUseCase;
  SearchBloc(this.searchUseCase) : super(const SearchState()) {
    on<SearchAllEvent>(_searchAll);
  }

  FutureOr<void> _searchAll(SearchAllEvent event, Emitter<SearchState> emit)async {
  final result = await searchUseCase(SearchParameters(pageNumber:event. pageNumber, pageSize: event.pageSize, query: event.query));
  result.fold((l) => emit(state.copyWith(
  searchState: RequestState.error,searchMessage: l.massage,
  )), (r) => emit(state.copyWith(
  search: r,
  searchState: RequestState.loaded,
  )));
  }
}
