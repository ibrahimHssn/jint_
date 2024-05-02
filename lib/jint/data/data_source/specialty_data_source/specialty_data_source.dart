import 'dart:developer';

import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/network/api_constance.dart';
import 'package:jint/core/network/api_service.dart';
import 'package:jint/core/network/error_massage_model.dart';
import 'package:jint/jint/data/models/specialty_model.dart';
import 'package:jint/jint/domain/usecase/specialty_usecase/specialty_parameters.dart';

abstract class BaseSpecialtyDataSource{
  Future<List<SpecialtyModel>> getSpecialty(SpecialtyParameters parameters);
  Future<SpecialtyModel> addSpecialty(SpecialtyParameters parameters);
  Future<SpecialtyModel> updateSpecialty(SpecialtyParameters parameters);
  Future<SpecialtyModel> deleteSpecialty(SpecialtyParameters parameters);


}

class SpecialtyRemoteDataSource implements BaseSpecialtyDataSource{
  @override
  Future<List<SpecialtyModel>> getSpecialty(SpecialtyParameters parameters) async{
    final specialty = SpecialtyDataSource(actionType: 'get', pageNumber: parameters.pageNumber, pageSize: parameters.pageSize);
    final response=await ApiService.postData(baseUrl:ApiConstance.getSpecialtyPath, data: specialty.toMap());
    if(response.statusCode==200){
      return List<SpecialtyModel>.from((response.data["data"] as List).map((e) => SpecialtyModel.fromJson(e)));
    }
    else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<SpecialtyModel> addSpecialty(SpecialtyParameters parameters)async {
    final specialty = SpecialtyDataSource(
      actionType: 'post',
        name: parameters.name,
        jopName: parameters.jopName,
        price: parameters.price,
        color: parameters.color,
        isPublic: parameters.isPublic,
        notes: parameters.notes,
        ownerId: parameters.ownerId,
        code: parameters.code, pageNumber: 0, pageSize: 0);
    final response=await ApiService.postData(baseUrl: ApiConstance.addSpecialtyPath, data: specialty.toMap());
    if(response.statusCode==200){
      return SpecialtyModel.fromJson(response.data);
    }
    else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<SpecialtyModel> updateSpecialty(SpecialtyParameters parameters) async{
   final specialty = SpecialtyDataSource(
       actionType: 'put',
       id: parameters.id,
       name: parameters.name,
       jopName: parameters.jopName,
       price: parameters.price,
       color: parameters.color,
       isPublic: parameters.isPublic,
       notes: parameters.notes,
       ownerId: parameters.ownerId,
       code: parameters.code, pageNumber: 0, pageSize: 0);
   final response=await ApiService.putData(baseUrl: ApiConstance.updateSpecialtyPath, data: specialty.toMap());
   if(response.statusCode==200){
     return SpecialtyModel.fromJson(response.data);
   }
   else {
     throw ServerException(
         errorMassageModel: ErrorMassageModel.fromJson(response.data));
   }

  }

  @override
  Future<SpecialtyModel> deleteSpecialty(SpecialtyParameters parameters)async {
    final response=await ApiService.deleteData(baseUrl: ApiConstance.deleteSpecialtyPath(specialtyId: parameters.id.toString()),);
    if(response.statusCode==200){
      return SpecialtyModel.fromJson(response.data);
    }
    else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }



}


class SpecialtyDataSource extends SpecialtyParameters{
  const SpecialtyDataSource({ super.actionType,  super.pageNumber,  super.pageSize,  super.id,  super.name,  super.jopName,  super.price,  super.color,  super.isPublic,  super.notes,  super.ownerId,  super.code});


     Map<String, dynamic> toMap() {
      return {
        if( actionType=="get")...{"pageNumber":pageNumber, "pageSize":pageSize,},
        if(actionType=="post")...{
          'name': name,
          'notes': notes,
          'color': color,
          'code': code,
          'jopName': jopName,
          'price': price,
          'price': price,
          'isPublic': isPublic,
        },
        if(actionType=="put")...{
          'id': id,
          'ownerId': ownerId,
          'name': name,
          'notes': notes,
          'color': color,
          'code': code,
          'jopName': jopName,
          'price': price,
          'price': price,
          'isPublic': isPublic,
        },
    };
  }

}