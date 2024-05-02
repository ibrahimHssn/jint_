import 'package:equatable/equatable.dart';

class ProfileImg extends Equatable {
  final String? url;

  const ProfileImg({this.url});

  @override
  @override
  List<Object?> get props => [url];
}