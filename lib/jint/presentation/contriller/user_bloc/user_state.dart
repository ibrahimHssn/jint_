import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/entities/images.dart';
import 'package:jint/jint/domain/entities/social_accounts.dart';
import 'package:jint/jint/domain/entities/user/user.dart';

class UserState {
  final User? getUser;
  final RequestState? getUserState;
  final String? getUserMessage;

  final User? updateUser;
  final RequestState? updateUserState;
  final String? updateUserMessage;

  final ProfileImg? profileImg;
  final RequestState? profileState;
  final String? profileMessage;

  final RequestState? changePasswordState;
  final String? changePasswordMessage;


  final SocialAccounts? socialAccounts;
  final RequestState? socialAccountsState;
  final String? socialAccountsMessage;


  final SocialAccounts? deleteSocialAccounts;
  final RequestState? deleteSocialAccountsState;
  final String? deleteSocialAccountsMessage;

 const UserState({
    this.getUser,
    this.getUserState = RequestState.loading,
    this.getUserMessage = "",

    this.updateUser,
    this.updateUserState = RequestState.loading,
    this.updateUserMessage = "",

    this.profileImg,
    this.profileState = RequestState.loading,
    this.profileMessage = "",

    this.changePasswordState = RequestState.loading,
    this.changePasswordMessage = "",

    this.socialAccounts,
    this.socialAccountsState = RequestState.loading,
    this.socialAccountsMessage = "",

    this.deleteSocialAccounts,
    this.deleteSocialAccountsState = RequestState.loading,
    this.deleteSocialAccountsMessage = ""
  });
  UserState copyWith({
     User? getUser,
     RequestState? getUserState,
     String? getUserMessage,

     User? updateUser,
     RequestState? updateUserState,
     String? updateUserMessage,

     ProfileImg? profileImg,
     RequestState? profileState,
     String? profileMessage,

     RequestState? changePasswordState,
     String? changePasswordMessage,


     SocialAccounts? socialAccounts,
     RequestState? socialAccountsState,
     String? socialAccountsMessage,


     SocialAccounts? deleteSocialAccounts,
     RequestState? deleteSocialAccountsState,
     String? deleteSocialAccountsMessage,

}){
    return UserState(
      getUser: getUser??this.getUser,
      getUserState: getUserState??this.getUserState,
      getUserMessage: getUserMessage??this.getUserMessage,

      updateUser: updateUser??this.updateUser,
      updateUserState: updateUserState??this.updateUserState,
      updateUserMessage: updateUserMessage??this.updateUserMessage,

      profileImg: profileImg??this.profileImg,
      profileState: profileState??this.profileState,
      profileMessage: profileMessage??this.profileMessage,

      changePasswordState: changePasswordState??this.changePasswordState,
      changePasswordMessage:changePasswordMessage??this.changePasswordMessage,

      socialAccounts: socialAccounts??this.socialAccounts,
      socialAccountsState: socialAccountsState??this.socialAccountsState,
      socialAccountsMessage: socialAccountsMessage??this.socialAccountsMessage,

      deleteSocialAccounts:deleteSocialAccounts??this.deleteSocialAccounts,
      deleteSocialAccountsState: deleteSocialAccountsState??this.deleteSocialAccountsState,
      deleteSocialAccountsMessage: deleteSocialAccountsMessage??this.deleteSocialAccountsMessage,
    );
  }


  @override
  List<Object?> get props =>
      [
        getUser,
        getUserState,
        getUserMessage,
        updateUser,
        updateUserState,
        updateUserMessage,
        profileImg,
        profileState,
        profileMessage,
        changePasswordState,
        changePasswordMessage,
        socialAccounts,
        socialAccountsState,
        socialAccountsMessage,
        deleteSocialAccounts,
        deleteSocialAccountsState,
        deleteSocialAccountsMessage,
      ];


}

