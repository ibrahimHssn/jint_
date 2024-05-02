import 'package:equatable/equatable.dart';

class GetSocialAccountsParameters extends Equatable {
  final dynamic id;
  final String? userName;
  final String? link;
  final int? accountType;

  const GetSocialAccountsParameters(
      { this.id,  this.userName,  this.link,  this.accountType});

  @override
  List<Object?> get props => [id, userName, link, accountType];

}
