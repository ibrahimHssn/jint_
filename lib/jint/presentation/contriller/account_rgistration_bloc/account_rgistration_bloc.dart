import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/usecase/account_rgistration_use_case/account_rgistration_usecase.dart';

import 'account_rgistration_event.dart';
import 'account_rgistration_state.dart';


class AccountRgistrationBloc extends Bloc<AccountRgistrationEvent, AccountRgistrationState> {
  AccountRgistrationUseCase accountRgistrationUseCase;
  AccountRgistrationBloc(this.accountRgistrationUseCase) : super(const AccountRgistrationState()) {
    on<AccountRgistrationJintEvent>(_accountRgistrationJint);
  }

  FutureOr<void> _accountRgistrationJint(AccountRgistrationJintEvent event, Emitter<AccountRgistrationState> emit) async {
    final result = await accountRgistrationUseCase(AccountRgistrationParameters(
      name: event.name,
      userName: event.userName,
      phoneNumber: event.phoneNumber,
      password: event.password,
    ));
    result.fold((l) => emit(state.copyWith(
      accountRgistrationState: RequestState.error,accountRgistrationMessage: l.massage,
    )), (r) => emit(state.copyWith(
      user: r,
      accountRgistrationState: RequestState.loaded,
    )));
  }
}



