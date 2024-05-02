import 'package:equatable/equatable.dart';

abstract class DateEvent extends Equatable {
  const DateEvent();
}


class GetDateEvent extends DateEvent {
  final String specialtyId;

  GetDateEvent({required this.specialtyId});

  @override
  List<Object> get props => [specialtyId];
}


class AddDateEvent extends DateEvent {
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

  AddDateEvent(
      { this.specialtyId, this.dateName, this.dateNotes, this.dateType, this.isEndDate, this.country, this.governate, this.regionCity, this.street, this.buildingNumber, this.postalCode, this.floor, this.room, this.landmark, this.dditionalInformation, this.latitude, this.longitude, this.maxClientDateNo, this.isByGroub, this.isContinuous, this.startDateTime, this.endDateTime});

  @override
  List<Object?> get props =>
      [
        specialtyId,
        dateName,
        dateNotes,
        dateType,
        isEndDate,
        country,
        governate,
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


class UpdateDateEvent extends DateEvent {
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

  UpdateDateEvent(
      { required this.dateId, this.specialtyId, this.dateName, this.dateNotes, this.dateType, this.isEndDate, this.country, this.governate, this.regionCity, this.street, this.buildingNumber, this.postalCode, this.floor, this.room, this.landmark, this.dditionalInformation, this.latitude, this.longitude, this.maxClientDateNo, this.isByGroub, this.isContinuous, this.startDateTime, this.endDateTime});

  @override
  List<Object?> get props =>
      [
        dateId,
        specialtyId,
        dateName,
        dateNotes,
        dateType,
        isEndDate,
        country,
        governate,
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

class DeleteDateEvent extends DateEvent {
  final String? dateId;

  DeleteDateEvent({required this.dateId});

  @override
  List<Object?> get props => [dateId];
}