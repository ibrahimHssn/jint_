import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final int id;
  final String country;
  final String countryAr;
  final String countryEn;
  final int governateNo;
  final String governateEn;
  final String governateAr;
  final int regionCityNo;
  final String regionCityEn;
  final String regionCityAr;
  final String street;
  final String buildingNumber;
  final String postalCode;
  final String floor;
  final String room;
  final String landmark;
  final String dditionalInformation;
  final double latitude;
  final double longitude;

  const Address(
      {required this.id, required this.country, required this.countryAr, required this.countryEn, required this.governateNo, required this.governateEn, required this.governateAr, required this.regionCityNo, required this.regionCityEn, required this.regionCityAr, required this.street, required this.buildingNumber, required this.postalCode, required this.floor, required this.room, required this.landmark, required this.dditionalInformation, required this.latitude, required this.longitude});

  @override
  List<Object> get props =>
      [
        id,
        country,
        countryAr,
        countryEn,
        governateNo,
        governateEn,
        governateAr,
        regionCityNo,
        regionCityEn,
        regionCityAr,
        street,
        buildingNumber,
        postalCode,
        floor,
        room,
        landmark,
        dditionalInformation,
        latitude,
        longitude,
      ];
}