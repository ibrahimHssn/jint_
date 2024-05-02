import 'package:equatable/equatable.dart';
import 'package:jint/jint/domain/entities/addresss.dart';
import 'package:jint/jint/domain/entities/images.dart';
import 'package:jint/jint/domain/entities/social_accounts.dart';


class User extends Equatable {
  final String id;
  final String email;
  final String userName;
  final String phoneNumber;
  final String bio;
  final String about;
  final String name;
  final ProfileImg profileImg;
  final List<SocialAccounts> socialAccounts;
  final Address address;


  const User({
    required this.id,
      required this.email,
      required this.userName,
      required this.phoneNumber,
      required this.bio,
      required this.about,
      required this.name,
      required this.profileImg,
      required this.socialAccounts,
      required this.address,
  });



  @override
  List<Object> get props => [
    id,
    email,
    userName,
    phoneNumber,
    bio,
    about,
    name,
    profileImg,
    socialAccounts,
    address,
  ];

}
