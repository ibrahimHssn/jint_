
import 'package:jint/core/network/api_constance.dart';
import 'package:jint/jint/domain/entities/images.dart';

class ProfileImageModel extends ProfileImg {
  const ProfileImageModel({required super.url});

  factory ProfileImageModel.fromJson(Map<String, dynamic> json)=>ProfileImageModel(url: json['profileImg']??ApiConstance.imgUrl);

}