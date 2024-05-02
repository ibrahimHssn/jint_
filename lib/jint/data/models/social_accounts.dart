import 'package:jint/jint/domain/entities/social_accounts.dart';

class SocialAccountsModel extends SocialAccounts{
  const SocialAccountsModel({required super.id, required super.userName,
    required super.link, required super.accountType});

  factory SocialAccountsModel.fromJson(Map<String, dynamic> json)=>
      SocialAccountsModel(id: json['id'], userName: json['userName']??"", link: json['link']??"", accountType: json['accountType']??0);

}