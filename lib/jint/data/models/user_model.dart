import 'package:jint/core/network/api_constance.dart';
import 'package:jint/jint/data/models/profile_img_model.dart';
import 'package:jint/jint/data/models/social_accounts.dart';
import 'package:jint/jint/domain/entities/user/user.dart';

import 'address_model.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.email,
      required super.userName,
      required super.phoneNumber,
      required super.bio,
      required super.about,
      required super.name,
      required super.profileImg,
      required super.socialAccounts,
      required super.address,
   });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id']??"",
        email: json['email']??"",
        userName: json['userName']??"",
        phoneNumber: json['phoneNumber']??"",
        bio: json['bio']??"bio",
        about: json['about']??"about",
        name: json['name']??"",
    profileImg: json['profileImg'] != null
        ? ProfileImageModel.fromJson(json['profileImg'])
        : const ProfileImageModel(url: ApiConstance.imgUrl),

      socialAccounts: json['socialAccounts'] != null && json['socialAccounts'] is List
          ? List<SocialAccountsModel>.from(
          (json["socialAccounts"] as List<dynamic>)
              .map((e) => SocialAccountsModel.fromJson(e)))
          : [],

      address:
      json['address'] != null
          ? AddressModel.fromJson(json['address'])
          : const AddressModel(
              id: 0,
              country: "",
              countryAr: "",
              countryEn: "",
              governateNo: 0,
              governateEn: "",
              governateAr: "",
              regionCityNo: 0,
              regionCityEn: "",
              regionCityAr: "",
              street: "",
              buildingNumber: "",
              postalCode: "",
              floor: "",
              room: "",
              landmark: "",
              dditionalInformation: "",
              latitude: 0,
              longitude: 0));

}
