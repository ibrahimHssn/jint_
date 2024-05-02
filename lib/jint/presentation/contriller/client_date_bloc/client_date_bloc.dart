
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/usecase/client_date_use_case/client_date_parameters.dart';
import 'package:jint/jint/domain/usecase/client_date_use_case/delete_client_date_use_case.dart';
import 'package:jint/jint/domain/usecase/client_date_use_case/get_all_recived_use_case.dart';
import 'package:jint/jint/domain/usecase/client_date_use_case/get_all_sended_use_case.dart';
import 'package:jint/jint/domain/usecase/client_date_use_case/get_client_date_use_case.dart';
import 'package:jint/jint/domain/usecase/client_date_use_case/get_client_get_all-by_date_use_case.dart';
import 'package:jint/jint/domain/usecase/client_date_use_case/re_action_client_date_use_case.dart';
import 'package:jint/jint/domain/usecase/client_date_use_case/register_client_date_use_case.dart';
import 'package:jint/jint/domain/usecase/client_date_use_case/update_client_date_use_case.dart';

import 'client_date_event.dart';
import 'client_date_state.dart';

class ClientDateBloc extends Bloc<ClientDateEvent, ClientDateState> {
  final GetClientDateUseCase getClientDateUseCase;
  final GetClientGetAllByDateUseCase getClientGetAllByDateUseCase;
  final GetAllRecivedUseCase getAllRecivedUseCase;
  final GetAllSendedUseCase getAllSendedUseCase;
  final RegisterClientDateUseCase registerClientDateUseCase;
  final UpdateClientDateUseCase updateClientDateUseCase;
  final ReActionClientDateUseCase reActionClientDateUseCase;
  final DeleteClientDateUseCase deleteClientDateUseCase;

  ClientDateBloc(
      this.getClientDateUseCase,
      this.getClientGetAllByDateUseCase,
      this.getAllRecivedUseCase,
      this.getAllSendedUseCase,
      this.registerClientDateUseCase,
      this.updateClientDateUseCase,
      this.reActionClientDateUseCase,
      this.deleteClientDateUseCase,
      ) : super(const ClientDateState()) {
    on<GetClientDateEvent>(_getClientDate);
    on<GetClientGetAllByDateEvent>(_getClientGetAllByDate);
    on<GetAllRecivedEvent>(_getAllRecived);
    on<GetAllSendedEvent>(_getAllSended);
    on<RegisterClientDateEvent>(_registerClientDate);
    on<UpdateClientDateEvent>(_updateClientDate);
    on<ReActionClientDateEvent>(_reActionClientDate);
    on<DeleteClientDateEvent>(_deleteClientDate);
  }

  Future<void> _getClientDate(GetClientDateEvent event, Emitter<ClientDateState> emit) async {
    final result = await getClientDateUseCase(ClientDateParameters(id: event.clientDateId));
    result.fold((l) => emit(state.copyWith(
      getClientDateByIdState: RequestState.error,getClientDateByIdMessage: l.massage,
    )), (r) => emit(state.copyWith(
      getClientDateById: r,
      getClientDateByIdState: RequestState.loaded,
    )));

  }

  FutureOr<void> _getClientGetAllByDate(GetClientGetAllByDateEvent event, Emitter<ClientDateState> emit) async{
    final result = await getClientGetAllByDateUseCase(ClientDateParameters(dateId: event.dateId));
    result.fold((l) => emit(state.copyWith(
      getClientGetAllByDateState: RequestState.error,getClientGetAllByDateMessage: l.massage,
    )), (r) => emit(state.copyWith(
      getClientGetAllByDate: r,
      getClientGetAllByDateState: RequestState.loaded,
    )));
  }

  FutureOr<void> _getAllRecived(GetAllRecivedEvent event, Emitter<ClientDateState> emit)async {
    final result = await getAllRecivedUseCase(ClientDateParameters(
    dateId: event.dateId,
    status: event.status,
    pageNumber: event.pageNumber,
    pageSize: event.pageSize,
    ));
    result.fold((l) => emit(state.copyWith(
    getAllRecivedState: RequestState.error,getAllRecivedMessage: l.massage,
    )), (r) => emit(state.copyWith(
      getAllRecived: r,
      getAllRecivedState: RequestState.loaded,
    )));
  }

  FutureOr<void> _getAllSended(GetAllSendedEvent event, Emitter<ClientDateState> emit) async{
    final result = await getAllSendedUseCase(ClientDateParameters(
      status: event.status,
      pageNumber: event.pageNumber,
      pageSize: event.pageSize,
    ));
    result.fold((l) => emit(state.copyWith(
      getAllSendedState: RequestState.error,getAllSendedMessage: l.massage,
    )), (r) => emit(state.copyWith(
      getAllSended: r,
      getAllSendedState: RequestState.loaded,
    )));
  }

  FutureOr<void> _registerClientDate(RegisterClientDateEvent event, Emitter<ClientDateState> emit) async{
    final result = await registerClientDateUseCase(ClientDateParameters(
      dateId: event.dateId,
      reservationDate: event.reservationDate,
    ));
    result.fold((l) => emit(state.copyWith(
      registerClientDateState: RequestState.error,registerClientDateMessage: l.massage,
    )), (r) => emit(state.copyWith(
      registerClientDate: r,
      registerClientDateState: RequestState.loaded,
    )));
  }

  FutureOr<void> _updateClientDate(UpdateClientDateEvent event, Emitter<ClientDateState> emit) async{
    final result = await updateClientDateUseCase(ClientDateParameters(
      id: event.id,
      status: event.status,
      dateId: event.dateId,
      reservationDate: event.reservationDate,
    ));
    result.fold((l) => emit(state.copyWith(
      updateClientDateState: RequestState.error,updateClientDateMessage: l.massage,
    )), (r) => emit(state.copyWith(
      updateClientDate: r,
      updateClientDateState: RequestState.loaded,
    )));
  }

  FutureOr<void> _reActionClientDate(ReActionClientDateEvent event, Emitter<ClientDateState> emit) async{
    final result = await reActionClientDateUseCase(ClientDateParameters(
      id: event.id,
      status: event.status,
    ));
    result.fold((l) => emit(state.copyWith(
      reActionClientDateState: RequestState.error,reActionClientDateMessage: l.massage,
    )), (r) => emit(state.copyWith(
      reActionClientDate: r,
      reActionClientDateState: RequestState.loaded,
    )));
  }

  FutureOr<void> _deleteClientDate(DeleteClientDateEvent event, Emitter<ClientDateState> emit) async{
    final result = await deleteClientDateUseCase(ClientDateParameters(
      id: event.id,
    ));
    result.fold((l) => emit(state.copyWith(
      deleteClientDateState: RequestState.error,deleteClientDateMessage: l.massage,
    )), (r) => emit(state.copyWith(
      deleteClientDate: r,
      deleteClientDateState: RequestState.loaded,
    )));
  }
}
