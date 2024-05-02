import 'package:equatable/equatable.dart';

class SocialAccounts extends Equatable {
  final dynamic id;
  final String? userName;
  final String? link;
  final int accountType;

  const SocialAccounts(
      {required this.id,  this.userName,  this.link, required this.accountType});

  @override
  List<Object?> get props => [id, userName, link, accountType];
}