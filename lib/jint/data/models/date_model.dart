import 'package:jint/jint/data/models/address_model.dart';
import 'package:jint/jint/data/models/client_date_model.dart';
import 'package:jint/jint/domain/entities/date/date.dart';

import 'date_details_model.dart';

class DateModel extends  Date{
  const DateModel(
      {required super.startDate,
      required super.endDate,
      required super.isEndDate,
      required super.specialtyId,
      required super.address,
      required super.dateType,
      required super.dateDetails,
      required super.clientDate,
      required super.status,
      required super.id,
      required super.name,
      required super.notes,
      required super.no,
      required super.createdDate,
      required super.maxClientDateNo,
      required super.isByGroub,
      required super.isContinuous,
      required super.startDateTime,
      required super.endDateTime,

      });

  factory DateModel.fromJson(Map<String, dynamic> json) =>
      DateModel(
          startDate: json['startDate']??"",
          endDate: json['endDate']??"",
          isEndDate: json['isEndDate']??false,
          specialtyId: json['specialtyId']??"",
          dateType: json['dateType']??1,
          status: json['status']??0,
          id: json['id']??"",
          name: json["name"]??"",
          notes: json['notes']??"",
          no: json['no']??0,
          createdDate: json['createdDate']??"",
          dateDetails:
          json['dateDetails']!=null &&json['dateDetails'] is List?
          List<DateDetailsModel>.from((json['dateDetails']as List<dynamic>).map((e) => DateDetailsModel.fromJson(e))):[],

          clientDate:json['clientDate']!=null &&json['clientDate'] is List?
          List<ClientDateModel>.from((json['clientDate']as List<dynamic>).map((e) => ClientDateModel.fromJson(e))):[],


          address: json['address'] != null
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
              longitude: 0),
      maxClientDateNo: json['maxClientDateNo']??0,
      isByGroub: json['isByGroub']??false,
      isContinuous: json['isContinuous']??false,
        startDateTime: json['startDateTime'] != null ? DateTime.parse(json['startDateTime']) : DateTime.now(),
        endDateTime: json['endDateTime'] != null ? DateTime.parse(json['endDateTime']) : DateTime.now(),


      );
}