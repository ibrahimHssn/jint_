
import 'package:jint/core/utils/App_String.dart';
import 'package:jint/core/utils/local_preferences.dart';
import 'package:jwt_decode/jwt_decode.dart';

class ApiConstance{
  static const baseUrl="https://api20240211152703.azurewebsites.net/";
  static String token=LocalPreferences.getValue(key: AppString.saveToken);
  Map<String, dynamic> jwtData  = Jwt.parseJwt(token);
  static const imgUrl="https://www.simplilearn.com/ice9/free_resources_article_thumb/what_is_image_Processing.jpg";

  static const loginPath="${baseUrl}Login";
  static const registerPath="${baseUrl}Register";


  static String getUserByIdPath(String userId)=>"${baseUrl}User/Get?id=$userId";
  static const updateUserByIdPath="${baseUrl}User/Update";
  static const changeProfileUserByIdPath="${baseUrl}User/ChangeProfilePic";
  static const changePasswordUserByIdPath="${baseUrl}User/ChangePassword";
  static const addSocialAccountPath="${baseUrl}User/AddSocialAccount";
  static const deleteSocialAccountPath="${baseUrl}User/DeleteSocialAccount?socialAccountId=";



  static const getSpecialtyPath="${baseUrl}Specialty/GetPagingForMe";
  static const addSpecialtyPath="${baseUrl}Specialty/Create";
  static const updateSpecialtyPath="${baseUrl}Specialty/Update";
  static String deleteSpecialtyPath({required String specialtyId})=>"${baseUrl}Specialty/Delete?id=$specialtyId";


  static String getDatePath(String specialtyId)=>"${baseUrl}Date/GetAllBySpecialty?speacialityId=$specialtyId";
  static const addDatePath="${baseUrl}Date/Create";
  static const updateDatePath="${baseUrl}Date/Update";
  static String deleteDatePath({required String dateId})=>"${baseUrl}Date/Delete?id=$dateId";


  static String getDateDetailsPath(String dateId)=>"${baseUrl}DateDetail/GetAllByDate?dateId=$dateId";
  static const addDateDetailsPath="${baseUrl}DateDetail/Create";
  static const updateDateDetailsPath="${baseUrl}DateDetail/Update";
  static String deleteDateDetailsPath(String dateDetailsId)=>"${baseUrl}DateDetail/Delete?id=$dateDetailsId";



  static String getClientDatePath(String clientDateID)=>"${baseUrl}ClientDate/Get?id=$clientDateID";
  static String getClientGetAllByDatePath(String dateID)=>"${baseUrl}ClientDate/Get?id=$dateID";
  static String getAllRecivedPath(String dateID)=>"${baseUrl}ClientDate/GetAllRecivedPaging$dateID";
  static const getAllSendedPath="${baseUrl}ClientDate/GetAllSendedPaging";
  static const registerClientDatePath="${baseUrl}ClientDate/Register";
  static const updateClientDatePath="${baseUrl}ClientDate/Update";
  static const reActionClientDatePath="${baseUrl}ClientDate/ReAction";
  static String deleteClientDatePath(String clientDateID)=>"${baseUrl}ClientDate/Delete?id=$clientDateID";




  static const searchClientDatePath="${baseUrl}Search/AllPaging";


}