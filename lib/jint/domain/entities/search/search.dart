import 'package:equatable/equatable.dart';
import 'package:jint/jint/domain/entities/specialty/specialty.dart';
import 'package:jint/jint/domain/entities/user/user.dart';

class Search extends Equatable {
  final User user;
  final Specialty specialty;

  const Search({required this.user, required this.specialty});

  @override
  List<Object> get props => [user, specialty];

}