import 'package:equatable/equatable.dart';

abstract class ClientDateEvent extends Equatable {
  const ClientDateEvent();
}


class GetClientDateEvent extends ClientDateEvent {
  final String clientDateId;

  const GetClientDateEvent({required this.clientDateId});

  @override
  List<Object> get props => [clientDateId];
}


class GetClientGetAllByDateEvent extends ClientDateEvent {
  final String dateId;

  const GetClientGetAllByDateEvent({required this.dateId});

  @override
  List<Object> get props => [dateId];
}


class GetAllRecivedEvent extends ClientDateEvent {
  final int status;
  final String? dateId;
  final int pageNumber;
  final int pageSize;

  const GetAllRecivedEvent(
      {required this.status, this.dateId, required this.pageNumber, required this.pageSize});

  @override
  List<Object?> get props => [status, dateId, pageNumber, pageSize];
}


class GetAllSendedEvent extends ClientDateEvent {
  final int status;
  final int pageNumber;
  final int pageSize;

  const GetAllSendedEvent(
      {required this.status, required this.pageNumber, required this.pageSize});

  @override
  List<Object?> get props => [status, pageNumber, pageSize];
}

class RegisterClientDateEvent extends ClientDateEvent {
  final String dateId;
  final dynamic reservationDate;

  const RegisterClientDateEvent(
      {required this.dateId, required this.reservationDate});

  @override
  List<Object> get props => [dateId, reservationDate];
}

class UpdateClientDateEvent extends ClientDateEvent {
  final String id;
  final int status;
  final String dateId;
  final dynamic reservationDate;

  const UpdateClientDateEvent(
      {required this.id, required this.status, required this.dateId, required this.reservationDate});

  @override
  List<Object> get props => [id, status, dateId, reservationDate];
}

class ReActionClientDateEvent extends ClientDateEvent {
  final String id;
  final int status;

  const ReActionClientDateEvent({required this.id, required this.status});

  @override
  List<Object> get props => [id, status];

}

class  DeleteClientDateEvent extends ClientDateEvent {
  final String id;

  const DeleteClientDateEvent({required this.id, });

  @override
  List<Object> get props => [id,];

}