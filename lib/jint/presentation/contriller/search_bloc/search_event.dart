import 'package:equatable/equatable.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();
}


class SearchAllEvent extends SearchEvent {
  final String query;
  final int pageSize;
  final int pageNumber;

  const SearchAllEvent(
      {required this.query, required this.pageSize, required this.pageNumber});

  @override
  List<Object> get props => [query, pageSize, pageNumber];
}