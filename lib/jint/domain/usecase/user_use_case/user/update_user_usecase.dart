import 'package:dartz/dartz.dart';
import 'package:jint/core/error/failure.dart';
import 'package:jint/core/usecase/base_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:jint/jint/domain/entities/user/user.dart';
import 'package:jint/jint/domain/repositort/base_user_data_repositort.dart.dart';

class UpdateUserDataUseCase extends BaseUseCase<User, UserParameters>{
  final BaseUserDataRepository baseUserDataRepository;

  UpdateUserDataUseCase({required this.baseUserDataRepository});

  @override
  Future<Either<Failure, User>> call(UserParameters parameters) async{
   return await baseUserDataRepository.updateUserData(parameters);
  }

}



class UserParameters extends Equatable {
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

  const UserParameters(
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
