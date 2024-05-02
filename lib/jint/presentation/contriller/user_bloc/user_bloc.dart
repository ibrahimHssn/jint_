import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/usecase/user_use_case/social_ccounts_usecase/add_social_ccounts.dart';
import 'package:jint/jint/domain/usecase/user_use_case/social_ccounts_usecase/delete_social_ccounts.dart';
import 'package:jint/jint/domain/usecase/user_use_case/social_ccounts_usecase/get_social_accounts_parameters.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/change_Profile_img_usecase.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/change_password_usecase.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/get_user_usecase.dart';
import 'package:jint/jint/domain/usecase/user_use_case/user/update_user_usecase.dart';
import 'package:jint/jint/presentation/contriller/user_bloc/user_event.dart';
import 'package:jint/jint/presentation/contriller/user_bloc/user_state.dart';


class UserBloc extends Bloc<UserEvent, UserState> {
  GetUserUseCase getUserUseCase;
  UpdateUserDataUseCase updateUserDataUseCase;
  ChangeProfileImgUserDataUseCase changeProfileImgUserDataUseCase;
  ChangePasswordUseCase changePasswordUseCase;
  AddSocialAccountsUseCase addSocialAccountsUseCase;
  DeleteSocialAccountsUseCase deleteSocialAccountsUseCase;

  UserBloc(this.getUserUseCase, this.updateUserDataUseCase,
      this.changeProfileImgUserDataUseCase, this.changePasswordUseCase,this.addSocialAccountsUseCase,this.deleteSocialAccountsUseCase)
      : super(const UserState()) {
    on<GetUserEvent>(_getUser);
    on<UpdateUserEvent>(_updateUser);
    on<ChangeProfileImgUserEvent>(_changeProfileImgUser);
    on<ChangePasswordEvent>(_changePassword);
    on<AddSocialAccountsEvent>(_addSocialAccounts);

    on<DeleteSocialAccountsEvent>(_deleteSocialAccounts);
  }

  FutureOr<void> _getUser(GetUserEvent event, Emitter<UserState> emit) async{
    final result = await getUserUseCase(GetUserParameters(id: event.userId));
    result.fold((l) => emit(state.copyWith(getUserState: RequestState.error,getUserMessage: l.massage)),
            (r) => emit(state.copyWith(getUserState: RequestState.loaded,getUser: r)));
  }

  FutureOr<void> _updateUser(UpdateUserEvent event, Emitter<UserState> emit) async{
    final result = await updateUserDataUseCase(UserParameters(id: event.id,
        name: event.name,
        userName: event.userName,
        email: event.email,
        phoneNumber: event.phoneNumber,
        bio: event.bio,
        about:event. about,
        addressId: event.addressId,
        countryAr:event.countryAr,
        governateAr: event.governateAr,
        regionCityAr: event.regionCityAr,
        street: event.street,
        buildingNumber: event.buildingNumber,
        postalCode: event.postalCode,
        floor: event.floor,
        room:event. room,
        landmark: event.landmark,
        dditionalInformation: event.dditionalInformation,
        latitude: event.latitude,
        longitude: event.longitude));
    result.fold((l) => emit(state.copyWith(updateUserState: RequestState.error,updateUserMessage: l.massage)),
            (r) => emit(state.copyWith(updateUserState: RequestState.loaded,updateUser:r)));
  }

  FutureOr<void> _changeProfileImgUser(ChangeProfileImgUserEvent event, Emitter<UserState> emit) async{
    final result = await changeProfileImgUserDataUseCase(ChangeProfileParameters(url: event.url));
    result.fold((l) => emit(state.copyWith(profileState: RequestState.error,profileMessage: l.massage)),
            (r) => emit(state.copyWith(profileState: RequestState.loaded,profileImg: r)));
  }

  FutureOr<void> _changePassword(ChangePasswordEvent event, Emitter<UserState> emit) async{
    final result = await changePasswordUseCase(ChangePasswordParameters(currentPassword:event. currentPassword, newPassword:event. newPassword));
    result.fold((l) => emit(state.copyWith(changePasswordState: RequestState.error,changePasswordMessage: l.massage)),
            (r) => emit(state.copyWith(changePasswordState: RequestState.loaded,)));
  }



  FutureOr<void> _addSocialAccounts(AddSocialAccountsEvent event, Emitter<UserState> emit) async{
    final result = await addSocialAccountsUseCase(GetSocialAccountsParameters(accountType: event.accountType,userName: event.userName,link: event.link ));
    result.fold((l) => emit(state.copyWith(socialAccountsState: RequestState.error,socialAccountsMessage: l.massage)),
            (r) => emit(state.copyWith(socialAccountsState: RequestState.loaded,socialAccounts: r)));
  }

  FutureOr<void> _deleteSocialAccounts(DeleteSocialAccountsEvent event, Emitter<UserState> emit) async{
    final result = await deleteSocialAccountsUseCase(GetSocialAccountsParameters(id: event.socialAccountId ));
    result.fold((l) => emit(state.copyWith(deleteSocialAccountsState: RequestState.error,deleteSocialAccountsMessage: l.massage)),
            (r) => emit(state.copyWith(deleteSocialAccountsState: RequestState.loaded,deleteSocialAccounts: r)));

  }
}
