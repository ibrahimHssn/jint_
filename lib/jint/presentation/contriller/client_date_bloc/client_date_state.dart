import 'package:equatable/equatable.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:jint/jint/domain/entities/client_date/client_date.dart';

class ClientDateState extends Equatable {
  final  List<ClientDate>? getClientDateById;
  final RequestState? getClientDateByIdState;
  final String? getClientDateByIdMessage;

  final List<ClientDate>? getClientGetAllByDate;
  final RequestState? getClientGetAllByDateState;
  final String? getClientGetAllByDateMessage;

  final List<ClientDate>? getAllRecived;
  final RequestState? getAllRecivedState;
  final String? getAllRecivedMessage;

  final List<ClientDate>? getAllSended;
  final RequestState? getAllSendedState;
  final String? getAllSendedMessage;

  final ClientDate? registerClientDate;
  final RequestState? registerClientDateState;
  final String? registerClientDateMessage;

  final ClientDate? updateClientDate;
  final RequestState? updateClientDateState;
  final String? updateClientDateMessage;


  final ClientDate? reActionClientDate;
  final RequestState? reActionClientDateState;
  final String? reActionClientDateMessage;

  final ClientDate? deleteClientDate;
  final RequestState? deleteClientDateState;
  final String? deleteClientDateMessage;

  const ClientDateState({
    this.getClientDateById,
    this.getClientDateByIdState = RequestState.loading,
    this.getClientDateByIdMessage = "",

    this.getClientGetAllByDate = const[],
    this.getClientGetAllByDateState = RequestState.loading,
    this.getClientGetAllByDateMessage = "",

    this.getAllRecived = const[],
    this.getAllRecivedState = RequestState.loading,
    this.getAllRecivedMessage = "",

    this.getAllSended = const[],
    this.getAllSendedState = RequestState.loading,
    this.getAllSendedMessage = "",

    this.registerClientDate,
    this.registerClientDateState = RequestState.loading,
    this.registerClientDateMessage = "",

    this.updateClientDate,
    this.updateClientDateState = RequestState.loading,
    this.updateClientDateMessage = "",

    this.reActionClientDate,
    this.reActionClientDateState = RequestState.loading,
    this.reActionClientDateMessage = "",

    this.deleteClientDate,
    this.deleteClientDateState = RequestState.loading,
    this.deleteClientDateMessage = "",
  });

  ClientDateState copyWith({
    List<ClientDate>? getClientDateById,
    RequestState? getClientDateByIdState,
    String? getClientDateByIdMessage,

    List<ClientDate>? getClientGetAllByDate,
    RequestState? getClientGetAllByDateState,
    String? getClientGetAllByDateMessage,

    List<ClientDate>? getAllRecived,
    RequestState? getAllRecivedState,
    String? getAllRecivedMessage,

    List<ClientDate>? getAllSended,
    RequestState? getAllSendedState,
    String? getAllSendedMessage,

    ClientDate? registerClientDate,
    RequestState? registerClientDateState,
    String? registerClientDateMessage,

    ClientDate? updateClientDate,
    RequestState? updateClientDateState,
    String? updateClientDateMessage,


    ClientDate? reActionClientDate,
    RequestState? reActionClientDateState,
    String? reActionClientDateMessage,

    ClientDate? deleteClientDate,
    RequestState? deleteClientDateState,
    String? deleteClientDateMessage,
  }) {
    return ClientDateState(
      getClientDateById: getClientDateById ?? this.getClientDateById,
      getClientDateByIdState: getClientDateByIdState ??
          this.getClientDateByIdState,
      getClientDateByIdMessage: getClientDateByIdMessage ??
          this.getClientDateByIdMessage,

      getClientGetAllByDate: getClientGetAllByDate ??
          this.getClientGetAllByDate,
      getClientGetAllByDateState: getClientGetAllByDateState ??
          this.getClientGetAllByDateState,
      getClientGetAllByDateMessage: getClientGetAllByDateMessage ??
          this.getClientGetAllByDateMessage,

      getAllRecived: getAllRecived ?? this.getAllRecived,
      getAllRecivedState: getAllRecivedState ?? this.getAllRecivedState,
      getAllRecivedMessage: getAllRecivedMessage ?? this.getAllRecivedMessage,

      getAllSended: getAllSended ?? this.getAllSended,
      getAllSendedState: getAllSendedState ?? this.getAllSendedState,
      getAllSendedMessage: getAllSendedMessage ?? this.getAllSendedMessage,

      registerClientDate: registerClientDate ?? this.registerClientDate,
      registerClientDateState: registerClientDateState ??
          this.registerClientDateState,
      registerClientDateMessage: registerClientDateMessage ??
          this.registerClientDateMessage,

      updateClientDate: updateClientDate ?? this.updateClientDate,
      updateClientDateState: updateClientDateState ??
          this.updateClientDateState,
      updateClientDateMessage: updateClientDateMessage ??
          this.updateClientDateMessage,

      reActionClientDate: reActionClientDate ?? this.reActionClientDate,
      reActionClientDateState: reActionClientDateState ??
          this.reActionClientDateState,
      reActionClientDateMessage: reActionClientDateMessage ??
          this.reActionClientDateMessage,

      deleteClientDate: deleteClientDate ?? this.deleteClientDate,
      deleteClientDateState: deleteClientDateState ??
          this.deleteClientDateState,
      deleteClientDateMessage: deleteClientDateMessage ??
          this.deleteClientDateMessage,


    );
  }

  @override
  List<Object?> get props =>
      [
        getClientDateById,
        getClientDateByIdState,
        getClientDateByIdMessage,
        getClientGetAllByDate,
        getClientGetAllByDateState,
        getClientGetAllByDateMessage,
        getAllRecived,
        getAllRecivedState,
        getAllRecivedMessage,
        getAllSended,
        getAllSendedState,
        getAllSendedMessage,
        registerClientDate,
        registerClientDateState,
        registerClientDateMessage,
        updateClientDate,
        updateClientDateState,
        updateClientDateMessage,
        reActionClientDate,
        reActionClientDateState,
        reActionClientDateMessage,
        deleteClientDate,
        deleteClientDateState,
        deleteClientDateMessage,
      ];
}

