import 'package:equatable/equatable.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
}

class GetUserEvent extends UserEvent {
  final String userId;

  const GetUserEvent({required this.userId});

  @override
  List<Object> get props => [userId];
}


class UpdateUserEvent extends UserEvent {
  final String id;
  final String name;
  final String userName;
  final String email;
  final String phoneNumber;
  final String bio;
  final String about;
  final String addressId;
  final String countryAr;
  final String governateAr;
  final String regionCityAr;
  final String street;
  final String buildingNumber;
  final String postalCode;
  final String floor;
  final String room;
  final String landmark;
  final String dditionalInformation;
  final double latitude;
  final double longitude;

  const UpdateUserEvent(
      {required this.id, required this.name, required this.userName, required this.email, required this.phoneNumber, required this.bio, required this.about, required this.addressId, required this.countryAr, required this.governateAr, required this.regionCityAr, required this.street, required this.buildingNumber, required this.postalCode, required this.floor, required this.room, required this.landmark, required this.dditionalInformation, required this.latitude, required this.longitude});

  @override
  List<Object> get props =>
      [
        id,
        name,
        userName,
        email,
        phoneNumber,
        bio,
        about,
        addressId,
        countryAr,
        governateAr,
        regionCityAr,
        street,
        buildingNumber,
        postalCode,
        floor,
        room,
        landmark,
        dditionalInformation,
        latitude,
        longitude,
      ];
}


class ChangeProfileImgUserEvent extends UserEvent {
  final String url;

  const ChangeProfileImgUserEvent({required this.url});

  @override
  List<Object> get props => [url];
}


class ChangePasswordEvent extends UserEvent {
  final String currentPassword;
  final String newPassword;

  const ChangePasswordEvent(
      {required this.currentPassword, required this.newPassword});


  @override
  List<Object> get props => [currentPassword, newPassword];
}


class AddSocialAccountsEvent extends UserEvent {
  final String? userName;
  final String? link;
  final int? accountType;

  const AddSocialAccountsEvent({this.userName, this.link, this.accountType});

  @override
  List<Object?> get props => [userName, link, accountType];


}


class DeleteSocialAccountsEvent extends UserEvent {
  final String socialAccountId;

  const DeleteSocialAccountsEvent({required this.socialAccountId});

  @override
  List<Object> get props => [socialAccountId];
}
