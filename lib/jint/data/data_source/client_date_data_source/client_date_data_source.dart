import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/network/api_String.dart';
import 'package:jint/core/network/api_constance.dart';
import 'package:jint/core/network/api_service.dart';
import 'package:jint/core/network/error_massage_model.dart';
import 'package:jint/jint/data/models/client_date_model.dart';
import 'package:jint/jint/domain/usecase/client_date_use_case/client_date_parameters.dart';

abstract class BaseClientDateDataSource{
  Future<List<ClientDateModel>> getClientDate(ClientDateParameters parameters);
  Future<List<ClientDateModel>> getClientGetAllByDate(ClientDateParameters parameters);
  Future<List<ClientDateModel>> getAllRecived(ClientDateParameters parameters);
  Future<List<ClientDateModel>> getAllSended(ClientDateParameters parameters);
  Future<ClientDateModel> registerClientDate(ClientDateParameters parameters);
  Future<ClientDateModel> updateClientDate(ClientDateParameters parameters);
  Future<ClientDateModel> reActionClientDate(ClientDateParameters parameters);
  Future<ClientDateModel> deleteClientDate(ClientDateParameters parameters);

}

class ClientDateRemoteDataSource implements BaseClientDateDataSource{
  @override
  Future<List<ClientDateModel>> getClientDate(ClientDateParameters parameters)  async{
    final response=await ApiService.getData(baseUrl: ApiConstance.getClientDatePath(parameters.id.toString()));
    if(response.statusCode==200){
      return List<ClientDateModel>.from((response.data["data"] as List).map((e) => ClientDateModel.fromJson(e)));
    }
    else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }

  }

  @override
  Future<List<ClientDateModel>> getClientGetAllByDate(ClientDateParameters parameters) async{
    final response=await ApiService.getData(baseUrl: ApiConstance.getClientGetAllByDatePath(parameters.dateId.toString()));
    if(response.statusCode==200){
      return List<ClientDateModel>.from((response.data["data"] as List).map((e) => ClientDateModel.fromJson(e)));
    }
    else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }

  }

  @override
  Future<List<ClientDateModel>> getAllRecived(ClientDateParameters parameters) async{
    final getAllSendedAndRecivedParametersDataSource=GetAllSendedAndRecivedParametersDataSource(actionType: ApiString.recived,status: parameters.status,dateId: parameters.dateId,pageNumber:parameters.pageNumber,pageSize: parameters.pageSize );

    final response=await ApiService.postData(baseUrl: ApiConstance.getAllRecivedPath(parameters.dateId.toString()),data: getAllSendedAndRecivedParametersDataSource.toMap());
    if(response.statusCode==200){
      return List<ClientDateModel>.from((response.data["data"] as List).map((e) => ClientDateModel.fromJson(e)));
    }
    else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }

  }

  @override
  Future<List<ClientDateModel>> getAllSended(ClientDateParameters parameters)async{
    final getAllSendedAndRecivedParametersDataSource=GetAllSendedAndRecivedParametersDataSource(actionType: ApiString.recived,status: parameters.status,pageNumber:parameters.pageNumber,pageSize: parameters.pageSize );

    final response=await ApiService.postData(baseUrl: ApiConstance.getAllSendedPath,data: getAllSendedAndRecivedParametersDataSource.toMap());
    if(response.statusCode==200){
      return List<ClientDateModel>.from((response.data["data"] as List).map((e) => ClientDateModel.fromJson(e)));
    }
    else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }

  }

  @override
  Future<ClientDateModel> registerClientDate(ClientDateParameters parameters) async{
    final clientDateParametersDataSource=ClientDateParametersDataSource(actionType: "register",dateId:parameters.dateId,reservationDate: parameters.reservationDate );
    final response=await ApiService.postData(baseUrl: ApiConstance.registerClientDatePath, data: clientDateParametersDataSource.toMap());
    if(response.statusCode==200){
      return ClientDateModel.fromJson(response.data);
    }
    else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }

  }

  @override
  Future<ClientDateModel> updateClientDate(ClientDateParameters parameters) async{
    final clientDateParametersDataSource=ClientDateParametersDataSource(actionType: 'put',id:parameters.id ,dateId:parameters.dateId,status: parameters.status,reservationDate: parameters.reservationDate );
    final response=await ApiService.putData(baseUrl: ApiConstance.updateClientDatePath, data: clientDateParametersDataSource.toMap());
    if(response.statusCode==200){
      return ClientDateModel.fromJson(response.data);
    }
    else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }

  }

  @override
  Future<ClientDateModel> reActionClientDate(ClientDateParameters parameters) async{
    final clientDateParametersDataSource=ClientDateParametersDataSource(actionType: 'ReAction',id:parameters.id ,status: parameters.status, );
    final response=await ApiService.postData(baseUrl: ApiConstance.reActionClientDatePath, data: clientDateParametersDataSource.toMap());
    if(response.statusCode==200){
      return ClientDateModel.fromJson(response.data);
    }
    else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }

  }

  @override
  Future<ClientDateModel> deleteClientDate(ClientDateParameters parameters) async{
    final response=await ApiService.deleteData(baseUrl: ApiConstance.deleteClientDatePath(parameters.id.toString()),);
    if(response.statusCode==200){
      return ClientDateModel.fromJson(response.data);
    }
    else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

}




class GetAllSendedAndRecivedParametersDataSource extends ClientDateParameters{
   const GetAllSendedAndRecivedParametersDataSource({super.pageNumber, super.pageSize,super.dateId,super.actionType,super.status});



  Map<String, dynamic> toMap() {
    return {
      if(actionType=="Recived")"dateId":dateId,
      "pageNumber":pageNumber,
      "pageSize":pageSize,
      "status":status,

    };
  }

}


class ClientDateParametersDataSource extends ClientDateParameters{
  const ClientDateParametersDataSource({super.id,super.dateId,super.status,super.reservationDate,super.actionType,});



  Map<String, dynamic> toMap() {
    return {
      if(actionType=="put"||actionType=="ReAction")...{
        "id":id,
        "status":status,

      },

      if(actionType=="put"||actionType=="register")...{
        "dateId":dateId,
        "reservationDate":reservationDate,

      },

    };
  }

}
