import 'package:jint/core/network/api_constance.dart';
import 'package:jint/jint/data/models/address_model.dart';
import 'package:jint/jint/domain/entities/images.dart';
import 'package:jint/jint/domain/entities/search/search.dart';
import 'profile_img_model.dart';
import 'user_model.dart';
import 'specialty_model.dart';

class SearchModel extends Search {
  @override
  final UserModel user;
  @override
  final SpecialtyModel specialty;

  const SearchModel({
    required this.user,
    required this.specialty,
  }) : super(user: user, specialty: specialty);

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    final userJson = json['user'];
    final specialtyJson = json['specialty_bloc'];
    final user = userJson != null ? UserModel.fromJson(userJson) : null;
    final specialty = specialtyJson != null ? SpecialtyModel.fromJson(specialtyJson) : null;

    return SearchModel(user: user ?? const UserModel(id: "", email: "", userName: "", phoneNumber: "", bio: "", about: "", name: "", profileImg: ProfileImg(url: ""), socialAccounts: [], address: AddressModel(
        id: 0,
        country: "",
        countryAr: "",
        countryEn: "",
        governateNo: 0,
        governateEn: "",
        governateAr: "",
        regionCityNo: 0,
        regionCityEn: "",
        regionCityAr: "",
        street: "",
        buildingNumber: "",
        postalCode: "",
        floor: "",
        room: "",
        landmark: "",
        dditionalInformation: "",
        latitude: 0,
        longitude: 0)),
        specialty: specialty ??
            SpecialtyModel(
                code: "",
                dates: const [],
                ownerId: "",
                secretaries: const [],
                isPublic: false,
                color: "",
                price: 0,
                jopId: "",
                jopName: "",
                id: "",
                name: "",
                notes: "",
                createdDate: "",

                owner:UserModel(
                id: "",
                email: "",
                userName: "",
                phoneNumber: "",
                bio: "",
                about: "",
                name: "",
                profileImg: json['profileImg'] != null
                    ? ProfileImageModel.fromJson(json['profileImg'])
                    : const ProfileImageModel(url: ApiConstance.imgUrl),
                socialAccounts: const [],
                address: json['address'] != null && json['address'] is Map<String, dynamic>
                    ? AddressModel.fromJson(json['address'])
                    : const AddressModel(
                    id: 0,
                    country: "",
                    countryAr: "",
                    countryEn: "",
                    governateNo: 0,
                    governateEn: "",
                    governateAr: "",
                    regionCityNo: 0,
                    regionCityEn: "",
                    regionCityAr: "",
                    street: "",
                    buildingNumber: "",
                    postalCode: "",
                    floor: "",
                    room: "",
                    landmark: "",
                    dditionalInformation: "",
                    latitude: 0,
                    longitude: 0)) ,

            ));
  }
}
