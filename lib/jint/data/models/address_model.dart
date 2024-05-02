import 'package:jint/jint/domain/entities/addresss.dart';

class AddressModel extends Address{
  const AddressModel({required super.id, required super.country, required super.countryAr, required super.countryEn, required super.governateNo, required super.governateEn, required super.governateAr, required super.regionCityNo, required super.regionCityEn, required super.regionCityAr, required super.street, required super.buildingNumber, required super.postalCode, required super.floor, required super.room, required super.landmark, required super.dditionalInformation, required super.latitude, required super.longitude});

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] ?? "",
      country: json['country'] ?? "",
      countryAr: json['countryAr'] ?? "",
      countryEn: json['countryEn'] ?? "",
      governateNo: json['governateNo'] ?? 0,
      governateEn: json['governateEn'] ?? "",
      governateAr: json['governateAr'] ?? "",
      regionCityNo: json['regionCityNo'] ??0,
      regionCityEn: json['regionCityEn'] ?? "",
      regionCityAr: json['regionCityAr'] ?? "",
      street: json['street'] ?? "",
      buildingNumber: json['buildingNumber'] ?? "",
      postalCode: json['postalCode'] ?? "",
      floor: json['floor'] ?? "",
      room: json['room'] ?? "",
      landmark: json['landmark'] ?? "",
      dditionalInformation: json['dditionalInformation'] ?? "",
      latitude: (json['latitude'] as int).toDouble() ?? 0.0,
      longitude: (json['longitude'] as int).toDouble() ?? 0.0,
    );
  }
}