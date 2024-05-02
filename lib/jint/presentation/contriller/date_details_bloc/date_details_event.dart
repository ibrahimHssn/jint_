import 'package:equatable/equatable.dart';


abstract class DateDetailsEvent extends Equatable {}


class GetDateDetailsEvent extends DateDetailsEvent {
  final String? dateId;

   GetDateDetailsEvent({ this.dateId});

  @override
  List<Object?> get props => [dateId];
}

class AddDateDetailsEvent extends DateDetailsEvent {
  final String dateId;
  final dynamic startHour;
  final dynamic endHour;
  final dynamic startDay;
  final dynamic endDay;

  AddDateDetailsEvent(
      {required this.dateId, required this.startHour, required this.endHour, required this.startDay, required this.endDay});

  @override
  List<Object> get props => [dateId, startHour, endHour, startDay, endDay];
}

class UpdateDateDetailsEvent extends DateDetailsEvent {
  final String id;
  final String dateId;
  final dynamic startHour;
  final dynamic endHour;
  final dynamic startDay;
  final dynamic endDay;

  UpdateDateDetailsEvent(
      {required this.id, required this.dateId, required this.startHour, required this.endHour, required this.startDay, required this.endDay});

  @override
  List<Object> get props => [id, dateId, startHour, endHour, startDay, endDay];
}

class DeleteDateDetailsEvent extends DateDetailsEvent {
  final String idDateDetails;

  DeleteDateDetailsEvent({required this.idDateDetails});

  @override
  List<Object> get props => [idDateDetails];
}