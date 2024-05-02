import 'dart:developer';

import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/network/api_constance.dart';
import 'package:jint/core/network/api_service.dart';
import 'package:jint/core/network/error_massage_model.dart';
import 'package:jint/jint/data/models/date_model.dart';
import 'package:jint/jint/domain/usecase/date_use_case/date_parameters.dart';

abstract class BaseDateDataSource{
  Future<List<DateModel>> getDate(DateParameters parameters);
  Future<DateModel> addDate(DateParameters parameters);
  Future<DateModel> updateDate(DateParameters parameters);
  Future<DateModel> deleteDate(DateParameters parameters);
}


class DateRemoteDataSource implements BaseDateDataSource{
  @override
  Future<List<DateModel>> getDate(DateParameters parameters) async{
    final  response= await ApiService.getData(baseUrl: ApiConstance.getDatePath(parameters.specialtyId.toString()));
    if(response.statusCode==200){
      log("Date: ${response.data}");
      return List<DateModel>.from((response.data as List).map((e) => DateModel.fromJson(e)));
    }
    else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }
  @override
  Future<DateModel> addDate(DateParameters parameters) async{
    final dateParameters=DateParametersDataSource(dateName: parameters.dateName,
      specialtyId: parameters.specialtyId,actionType: parameters.actionType,maxClientDateNo: parameters.maxClientDateNo,
      isByGroub: parameters.isByGroub,isContinuous: parameters.isContinuous,startDateTime: parameters.startDateTime,isEndDate: parameters.isEndDate,
      dateType: parameters.dateType,dateNotes: parameters.dateNotes,endDateTime: parameters.endDateTime,
      country: parameters.country,governate: parameters.governate,regionCity: parameters.regionCity,
      street: parameters.street,floor: parameters.floor,room: parameters.room,postalCode: parameters.postalCode,
      buildingNumber: parameters.buildingNumber, dditionalInformation: parameters.dditionalInformation,landmark: parameters.landmark,
      latitude: parameters.latitude,longitude: parameters.longitude,
    );
    final response=await ApiService.postData(baseUrl: ApiConstance.addDatePath, data: dateParameters.toMap());
    if(response.statusCode==200){
      return DateModel.fromJson(response.data);
    }
    else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<DateModel> updateDate(DateParameters parameters) async{
    final dateParameters=DateParametersDataSource(dateId:parameters.dateId,dateName: parameters.dateName,
      specialtyId: parameters.specialtyId,actionType: parameters.actionType,maxClientDateNo: parameters.maxClientDateNo,
      isByGroub: parameters.isByGroub,isContinuous: parameters.isContinuous,startDateTime: parameters.startDateTime,isEndDate: parameters.isEndDate,
      dateType: parameters.dateType,dateNotes: parameters.dateNotes,endDateTime: parameters.endDateTime,
      country: parameters.country,governate: parameters.governate,regionCity: parameters.regionCity,
      street: parameters.street,floor: parameters.floor,room: parameters.room,postalCode: parameters.postalCode,
      buildingNumber: parameters.buildingNumber, dditionalInformation: parameters.dditionalInformation,landmark: parameters.landmark,
      latitude: parameters.latitude,longitude: parameters.longitude,
    );
    final response=await ApiService.putData(baseUrl: ApiConstance.updateDatePath, data: dateParameters.toMap());
    if(response.statusCode==200){
      return DateModel.fromJson(response.data);
    }
    else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<DateModel> deleteDate(DateParameters parameters) async{
    final response=await ApiService.deleteData(baseUrl: ApiConstance.deleteDatePath(dateId: parameters.dateId.toString()),);
    if(response.statusCode==200){
      return DateModel.fromJson(response.data);
    }
    else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }

  }



}


class DateParametersDataSource  extends DateParameters{
  const DateParametersDataSource(
      {super.actionType,
      super.dateId,
      super.specialtyId,
      super.dateName,
      super.dateNotes,
      super.dateType,
      super.isEndDate,
      super.country,
      super.governate,
      super.regionCity,
      super.street,
      super.buildingNumber,
      super.postalCode,
      super.floor,
      super.room,
      super.landmark,
      super.dditionalInformation,
      super.latitude,
      super.longitude,
      super.maxClientDateNo,
      super.isByGroub,
      super.isContinuous,
      super.startDateTime,
      super.endDateTime});


  Map<String, dynamic> toMap() {
    return {

      if (actionType == "put") "id": dateId,

      "name":dateName,
      "notes":dateNotes,
      "isEndDate":isEndDate,
      "specialtyId":specialtyId,
      "dateType":dateType,
      "maxClientDateNo":maxClientDateNo,
      "startDateTime":startDateTime,
      "endDateTime":endDateTime,
      "isByGroub":isByGroub,
      "isContinuous":isContinuous,
      'address': {
        'countryAr': country,
        'governateAr': governate,
        'regionCityAr': regionCity,
        'street': street,
        'buildingNumber': buildingNumber,
        'postalCode': postalCode,
        'floor': floor,
        'room': room,
        'landmark': landmark,
        'dditionalInformation': dditionalInformation,
        'latitude': latitude,
        'longitude': longitude,
   
      },

    };
  }

}