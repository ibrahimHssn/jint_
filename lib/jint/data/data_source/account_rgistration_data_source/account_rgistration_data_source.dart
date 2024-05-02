import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/network/api_constance.dart';
import 'package:jint/core/network/api_service.dart';
import 'package:jint/core/network/error_massage_model.dart';
import 'package:jint/jint/data/models/user_model.dart';
import 'package:jint/jint/domain/usecase/account_rgistration_use_case/account_rgistration_usecase.dart';

abstract class BaseAccountRgistrationDataSource{
  Future<UserModel> accountRgistration(AccountRgistrationParameters parameters);

}


class AccountRgistrationRemoteDataSource implements BaseAccountRgistrationDataSource{
  @override
  Future<UserModel> accountRgistration(AccountRgistrationParameters parameters) async{
    final accountRgistrationData =AccountRgistrationDataSource(name: parameters.name, userName: parameters.userName,  phoneNumber: parameters.phoneNumber, password: parameters.password);
    final response=await ApiService.postData(baseUrl: ApiConstance.registerPath, data: accountRgistrationData.toMap());
    if(response.statusCode==200){
      print("AccountRgistration ${response.data}");
      return UserModel.fromJson(response.data);
    }else{
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));

    }
  }

}


class AccountRgistrationDataSource extends AccountRgistrationParameters{
  const AccountRgistrationDataSource({required super.name, required super.userName,  super.email, required super.phoneNumber, required super.password});

  Map<String, dynamic> toMap() {
    return {
      'name': name.trim(),
      'userName': userName.trim(),
      'phoneNumber': phoneNumber.trim(),
      'password': password.trim(),
    };
  }

}