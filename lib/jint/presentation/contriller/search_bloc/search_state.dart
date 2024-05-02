import 'package:equatable/equatable.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/entities/search/search.dart';

class SearchState extends Equatable {
  final List<Search>? search;
  final RequestState? searchState;
  final String? searchMessage;

  const SearchState({ this.search = const[], this.searchState = RequestState
      .loading, this.searchMessage = ""});

  SearchState copyWith({
    List<Search>? search,
    RequestState? searchState,
    String? searchMessage,

  }) {
    return SearchState(
      search: search ?? this.search,
      searchState: searchState ?? this.searchState,
      searchMessage: searchMessage ?? this.searchMessage,
    );
  }

  @override
  List<Object?> get props => [search, searchState, searchMessage];
}

