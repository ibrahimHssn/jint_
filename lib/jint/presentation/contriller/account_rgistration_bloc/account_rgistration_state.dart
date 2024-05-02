import 'package:equatable/equatable.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/entities/user/user.dart';

class AccountRgistrationState extends Equatable {
  final User? user;
  final RequestState? accountRgistrationState;
  final String? accountRgistrationMessage;

  const AccountRgistrationState({this.user, this.accountRgistrationState = RequestState.loading, this.accountRgistrationMessage = ""});


  AccountRgistrationState copyWith({User? user, RequestState? accountRgistrationState, String? accountRgistrationMessage,}) {
    return AccountRgistrationState(
      user: user ?? this.user,
      accountRgistrationState: accountRgistrationState ?? this.accountRgistrationState,
      accountRgistrationMessage: accountRgistrationMessage ?? this.accountRgistrationMessage,
    );
  }

  @override
  List<Object?> get props => [
        user,
        accountRgistrationState,
        accountRgistrationMessage,
      ];
}
