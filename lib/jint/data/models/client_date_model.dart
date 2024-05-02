import 'package:jint/core/network/api_constance.dart';
import 'package:jint/jint/data/models/address_model.dart';
import 'package:jint/jint/domain/entities/client_date/client_date.dart';

import 'profile_img_model.dart';
import 'user_model.dart';

class ClientDateModel extends ClientDate{
  const ClientDateModel({required super.dateNo, required super.dateId, required super.client, required super.clientId, required super.status, required super.id, required super.name, required super.notes, required super.no, required super.isActive, required super.createdDate, required super.createdById, required super.createdByName, required super.cancelDate, required super.cancelById, required super.cancelByName});

  factory ClientDateModel.fromJson(Map<String, dynamic> json) =>
      ClientDateModel(
          dateNo: json['dateNo'],
          dateId: json['dateId'],
          clientId: json['clientId'],
          status: json['status'],
          id: json['id'],
          name: json['name'],
          notes:json['notes'],
          no: json['no'],
          isActive: json['isActive'],
          createdDate: json['createdDate'],
          createdById: json['createdById'],
          createdByName: json['createdByName'],
          cancelDate: json['cancelDate'],
          cancelById: json['cancelById'],
          cancelByName: json['cancelByName'],
          client:
          json['client'] != null
              ? UserModel.fromJson(json['client'])
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
              address: ['address'] != null
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