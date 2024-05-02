import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/network/api_constance.dart';
import 'package:jint/core/network/api_service.dart';
import 'package:jint/core/network/error_massage_model.dart';
import 'package:jint/jint/data/models/date_details_model.dart';
import 'package:jint/jint/domain/usecase/date_details_use_case/date_details_parameters.dart';

abstract class BaseDateDetailsDataSource{
  Future<List<DateDetailsModel>> getDateDetails(DateDetailsParameters parameters);
  Future<DateDetailsModel> addDateDetails(DateDetailsParameters parameters);
  Future<DateDetailsModel> updateDateDetails(DateDetailsParameters parameters);
  Future<DateDetailsModel> deleteDateDetails(DateDetailsParameters parameters);
}

class  DateDetailsRemoteDataSource implements BaseDateDetailsDataSource{
  @override
  Future<List<DateDetailsModel>> getDateDetails(DateDetailsParameters parameters) async{
    final response=await ApiService.getData(baseUrl: ApiConstance.getDatePath(parameters.dateId.toString()));
    if(response.statusCode==200){
      return List<DateDetailsModel>.from((response.data["data"] as List).map((e) => DateDetailsModel.fromJson(e)));
    }
    else {
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }

  }

  @override
  Future<DateDetailsModel> addDateDetails(DateDetailsParameters parameters) async {
    final dateDetailsParametersDataSource = DateDetailsParametersDataSource(
        dateId: parameters.dateId,
        startHour: parameters.startHour,
        endHour: parameters.endHour,
        startDay: parameters.startDay,
        endDay: parameters.endDay
    );
    final response = await ApiService.postData(
        baseUrl: ApiConstance.addDateDetailsPath, data: dateDetailsParametersDataSource.toMap());
    if (response.statusCode == 200) {
      return DateDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<DateDetailsModel> updateDateDetails(DateDetailsParameters parameters)async {
    final dateDetailsParametersDataSource = DateDetailsParametersDataSource(
      id: parameters.id,
        dateId: parameters.dateId,
        startHour: parameters.startHour,
        endHour: parameters.endHour,
        startDay: parameters.startDay,
        endDay: parameters.endDay);
    final response = await ApiService.putData(
        baseUrl: ApiConstance.updateDateDetailsPath, data: dateDetailsParametersDataSource.toMap());
    if (response.statusCode == 200) {
      return DateDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }

  @override
  Future<DateDetailsModel> deleteDateDetails(DateDetailsParameters parameters) async {
    final response = await ApiService.deleteData(baseUrl: ApiConstance.deleteDateDetailsPath(parameters.id.toString()));
    if (response.statusCode == 200) {
      return DateDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }
}




class DateDetailsParametersDataSource extends DateDetailsParameters{
   DateDetailsParametersDataSource(
      {

         super.date,
       required super.dateId,
      required super.startHour,
      required super.endHour,
      required super.startDay,
      required super.endDay,
       super.status,
       super.id,
       super.name,
       super.notes,
       super.no,
       super.isActive});

  Map<String, dynamic> toMap() {
    return {
      if (actionType == "put") "id": id,

      'dateId': dateId,
      'startHour': startHour,
      'endHour': endHour,
      'startDay': startDay,
      'endDay': endDay,

    };
  }

}
