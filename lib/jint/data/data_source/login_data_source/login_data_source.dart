

import 'package:flutter/foundation.dart';
import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/network/api_String.dart';
import 'package:jint/core/network/api_constance.dart';
import 'package:jint/core/network/api_service.dart';
import 'package:jint/core/network/error_massage_model.dart';
import 'package:jint/core/utils/App_String.dart';
import 'package:jint/core/utils/local_preferences.dart';
import 'package:jint/jint/data/models/login_model.dart';
import 'package:jint/jint/domain/usecase/login_user_usecase/login_user_usecase.dart';import 'package:dio/dio.dart';


abstract class BaseLoginDataSource{
  Future<LoginModel> login(LoginParameters parameters);

}

class LoginRemoteDataSource implements BaseLoginDataSource {
  @override
  // Future<LoginModel> login(LoginParameters parameters)  async{
  //   final login = UserLogin(userName: parameters.userName, password: parameters.password);
  //   final response = await ApiService.postData(baseUrl: ApiConstance.loginPath, data: login.toMap());
  //   if(response.statusCode==200){
  //     LocalPreferences.saveData(key:AppString.saveToken, value: response.data[ApiString.apiObject]);
  //     return LoginModel.fromJson(response.data);
  //   }
  //   else{
  //     throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
  //
  //   }
  // }
  Future<LoginModel> login(LoginParameters parameters) async {


    final login = UserLogin(userName: parameters.userName, password: parameters.password);
      final response = await ApiService.postData(baseUrl: ApiConstance.loginPath, data: login.toMap());

      debugPrint('login response: ${response.data}');

      if (response.statusCode == 200) {
        LocalPreferences.saveData(key: AppString.saveToken, value: response.data[ApiString.apiObject]);
        return LoginModel.fromJson(response.data);
      } else {
        throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
      }

  }


}


class UserLogin extends LoginParameters {
  const UserLogin({
    required super.userName,
    required super.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName.trim(),
      'password': password.trim(),
    };
  }
}
