import 'package:equatable/equatable.dart';
class DateParameters extends Equatable {
  final String? actionType;
  final String? dateId;
  final String? specialtyId;
  final String? dateName;
  final String? dateNotes;
  final int? dateType;
  final bool? isEndDate;
  final String? country;
  final String? governate;
  final String? regionCity;
  final String? street;
  final String? buildingNumber;
  final String? postalCode;
  final String? floor;
  final String? room;
  final String? landmark;
  final String? dditionalInformation;
  final double? latitude;
  final double? longitude;
  final int? maxClientDateNo;
  final bool? isByGroub;
  final bool? isContinuous;
  final DateTime? startDateTime;
  final DateTime? endDateTime;

  const DateParameters(
      {this.actionType,
      this.dateId,
      this.specialtyId,
      this.dateName,
      this.dateNotes,
      this.dateType,
      this.isEndDate,
      this.country,
      this.governate,
      this.regionCity,
      this.street,
      this.buildingNumber,
      this.postalCode,
      this.floor,
      this.room,
      this.landmark,
      this.dditionalInformation,
      this.latitude,
      this.longitude,
      this.maxClientDateNo,
      this.isByGroub,
      this.isContinuous,
      this.startDateTime,
      this.endDateTime});


  @override
  List<Object?> get props =>
      [
        actionType,
        dateId,
        specialtyId,
        dateName,
        dateNotes,
        dateType,
        country,
        governate,
        isEndDate,
        regionCity,
        street,
        buildingNumber,
        postalCode,
        floor,
        room,
        landmark,
        dditionalInformation,
        latitude,
        longitude,
        maxClientDateNo,
        isByGroub,
        isContinuous,
        startDateTime,
        endDateTime,
      ];

}
