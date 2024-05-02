import 'package:jint/core/network/api_constance.dart';
import 'package:jint/jint/data/models/address_model.dart';
import 'package:jint/jint/data/models/date_model.dart';
import 'package:jint/jint/data/models/user_model.dart';
import 'package:jint/jint/domain/entities/specialty/specialty.dart';

import 'profile_img_model.dart';

class SpecialtyModel extends Specialty{
  const SpecialtyModel({required super.code, required super.dates, required super.owner, required super.ownerId, required super.secretaries, required super.isPublic, required super.color, required super.price, required super.jopId, required super.jopName, required super.id, required super.name, required super.notes, required super.createdDate});

  factory SpecialtyModel.fromJson(Map<String, dynamic> json) =>
      SpecialtyModel(
          code: json['code']??"",
          dates:
          json['dates']!=null &&json['dates'] is List?
          List<DateModel>.from((json['dates']as List<dynamic>).map((e) => DateModel.fromJson(e))):[],
          //owner: json['owner'] != null ? UserModel(id: id, email: email, userName: userName, phoneNumber: phoneNumber, bio: bio, about: about, name: name, profileImg: profileImg, socialAccounts: socialAccounts, address: address).fromJson(json['owner']) : null,
          ownerId: json['ownerId']??"",
          secretaries: const [],
          isPublic: json['isPublic']??false,
          color: json['color']??"4294198070",
          price: json['price']??0,
          jopId: json['jopId']??"",
          jopName: json['jopName']??"",
          id: json['jopName']??"",
          name: json['name']??"",
          notes: json['notes']??"",
          createdDate: json['createdDate']??"",
          owner: json['owner'] != null && json['owner'] is Map<String, dynamic>
              ? UserModel.fromJson(json['owner'])
              : UserModel(
              id: "",
              email: "",
              userName: "",
              phoneNumber: "",
              bio: "",
              about: "",
              name: "",
              profileImg: json['profileImg'] != null
                  ? ProfileImageModel.fromJson(json['profileImg'])
                  : const ProfileImageModel(url: ApiConstance.imgUrl),
              socialAccounts: const [],
              address: json['address'] != null && json['address'] is Map<String, dynamic>
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
                  longitude: 0))

      );
}