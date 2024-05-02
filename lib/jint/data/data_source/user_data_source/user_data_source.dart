import 'package:flutter/cupertino.dart';
import 'package:jint/core/error/exceptions.dart';
import 'package:jint/core/network/api_String.dart';
import 'package:jint/core/network/api_constance.dart';
import 'package:jint/core/network/api_service.dart';
import 'package:jint/core/network/error_massage_model.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:jint/jint/data/models/profile_img_model.dart';
import 'package:jint/jint/data/models/social_accounts.dart';
import 'package:jint/jint/data/models/user_model.dart';
import 'package:jint/jint/domain/usecase/user_use_case/social_ccounts_usecase/get_social_accounts_parameters.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/change_Profile_img_usecase.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/change_password_usecase.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/get_user_usecase.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/update_user_usecase.dart';

abstract class BaseUserDataSource{
  Future<UserModel> getUser(GetUserParameters parameters);
  Future<UserModel> updateUser(UserParameters parameters);
  Future<ProfileImageModel> changeProfileUser(ChangeProfileParameters parameters);
  Future<NoParameters> changePasswordUser(ChangePasswordParameters parameters);
  Future<SocialAccountsModel> addSocialAccounts(GetSocialAccountsParameters parameters);
  Future<SocialAccountsModel> deleteSocialAccounts(GetSocialAccountsParameters parameters);

}


class UserRemoteDataSource implements BaseUserDataSource {
  @override
  Future<UserModel> getUser(GetUserParameters parameters) async{
      final response = await ApiService.getData(
          baseUrl: ApiConstance.getUserByIdPath(parameters.id)
      );
      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      }
      else {
        throw ServerException(
            errorMassageModel: ErrorMassageModel.fromJson(response.data));
      }

  }

  @override
  Future<UserModel> updateUser(UserParameters parameters) async{
      final updateUser = UserData(
          id: parameters.id,
          name: parameters.name,
          userName: parameters.userName,
          email: parameters.email,
          phoneNumber: parameters.phoneNumber,
          bio: parameters.bio,
          about: parameters.about,
          addressId: parameters.addressId,
          countryAr: parameters.countryAr,
          governateAr: parameters.governateAr,
          regionCityAr: parameters.regionCityAr,
          street: parameters.street,
          buildingNumber: parameters.buildingNumber,
          postalCode: parameters.postalCode,
          floor: parameters.floor,
          room: parameters.room,
          landmark: parameters.landmark,
          dditionalInformation: parameters.dditionalInformation,
          latitude: parameters.latitude,
          longitude: parameters.longitude);
      final response = await ApiService.putData(
        baseUrl: ApiConstance.updateUserByIdPath,
        data: updateUser.toMap(),
      );
      if (response.statusCode == 200) {
        print("UpdateUser: ${response.data}");
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException(
            errorMassageModel: ErrorMassageModel.fromJson(response.data));
      }

  }


  @override
  Future<ProfileImageModel> changeProfileUser(ChangeProfileParameters parameters) async{
    final response = await ApiService.postData(baseUrl: ApiConstance.changeProfileUserByIdPath, data: {ApiString.changeProfilePic:parameters.url});
    if(response.statusCode==200){
      return ProfileImageModel.fromJson(response.data);
    }
    else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }

  }


  @override
  Future<SocialAccountsModel> addSocialAccounts(GetSocialAccountsParameters parameters) async {
      final addSocialAccount = (parameters.userName != null && parameters.userName!.isNotEmpty)
          ? SocialAccount(userName: parameters.userName!, accountType: parameters.accountType)
          : SocialAccount(link: parameters.link!, accountType: parameters.accountType);
      final response = await ApiService.postData(baseUrl: ApiConstance.addSocialAccountPath, data: addSocialAccount.toMap());

      if (response.statusCode == 200) {
        return SocialAccountsModel.fromJson(response.data);
      } else {
        print("ErrorMessage: ${response.data['Message']}");
        throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
      }

  }

  @override
  Future<SocialAccountsModel> deleteSocialAccounts(GetSocialAccountsParameters parameters) async{
       final response = await ApiService.getData(
          baseUrl: ApiConstance.deleteSocialAccountPath,
          queryParameters: {ApiString.socialAccountId: parameters.id});
      if (response.statusCode == 200) {
        return SocialAccountsModel.fromJson(response.data);
      }
      else {
        throw ServerException(
            errorMassageModel: ErrorMassageModel.fromJson(response.data));
      }

  }

  @override
  Future<NoParameters> changePasswordUser(ChangePasswordParameters parameters) async{
    final  changePassword=ChangePassword(currentPassword: parameters.currentPassword, newPassword: parameters.newPassword);
    final response = await ApiService.postData(baseUrl: ApiConstance.changePasswordUserByIdPath, data: changePassword.toMap());
    if(response.statusCode==200){
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
    else {
      throw ServerException(
          errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }






}


class UserData extends UserParameters {
  const UserData(
      {required super.id,
      required super.name,
      required super.userName,
      required super.email,
      required super.phoneNumber,
      required super.bio,
      required super.about,
      required super.addressId,
      required super.countryAr,
      required super.governateAr,
      required super.regionCityAr,
      required super.street,
      required super.buildingNumber,
      required super.postalCode,
      required super.floor,
      required super.room,
      required super.landmark,
      required super.dditionalInformation,
      required super.latitude,
      required super.longitude});

  Map<String, dynamic> toMap() {
    return {
      'id': id.toString(),
      'name': name.toString(),
      'userName': userName.toString(),
      'email': email.toString(),
      'phoneNumber': phoneNumber.toString(),
      'bio': bio.toString(),
      'about': about.toString(),
      "address": {
        'addressId': addressId.toString(),
        'countryAr': countryAr.toString(),
        'governateAr': governateAr.toString(),
        'regionCityAr': regionCityAr.toString(),
        'street': street.toString(),
        'buildingNumber': buildingNumber.toString(),
        'postalCode': postalCode.toString(),
        'floor': floor.toString(),
        'room': room.toString(),
        'landmark': landmark.toString(),
        'dditionalInformation': dditionalInformation.toString(),
        'latitude': latitude,
        'longitude': longitude,
      }


    };
  }
}

class SocialAccount extends GetSocialAccountsParameters {
  const SocialAccount({super.userName, super.link, required super.accountType});
  Map<String, dynamic> toMap() {
    return {
      'accountType': accountType,
      if (userName != null && userName!.isNotEmpty) 'userName': userName,
      if (link != null && link!.isNotEmpty) 'link': link,
    };
  }
}



class ChangePassword extends  ChangePasswordParameters{
  const ChangePassword({required super.currentPassword, required super.newPassword});
  Map<String, dynamic> toMap() {
    return {
      'currentPassword': currentPassword,
      'newPassword': newPassword,

    };
  }
}


