import 'package:dio/dio.dart';
import 'package:jint/core/network/api_constance.dart';

class ApiService{
  static var headers = {
    'Authorization': 'Bearer ${ApiConstance.token}',
    'Content-Type': 'application/json',
    'Accept-Language': 'en-US',
    'Accept': '*/*'
  };


  static Future<Response> postData({required String baseUrl, required Map<String, dynamic> data}) => Dio().post(baseUrl, data: data, options: Options(headers: headers));

  static Future<Response> getData({required String baseUrl,Map<String,dynamic>? queryParameters}) =>
      Dio().get(baseUrl, queryParameters: queryParameters,options: Options(headers: headers));

  static Future<Response> putData({required String baseUrl,required Map<String, dynamic>? data}) =>
      Dio().put(baseUrl,data: data, options: Options(headers: headers,));

  static Future<Response> deleteData({required String baseUrl, Map<String,dynamic>? queryParameters}) =>
      Dio().delete(baseUrl, queryParameters: queryParameters, options: Options(headers: headers));

}