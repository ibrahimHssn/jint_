import 'package:equatable/equatable.dart';

class DateDetails extends Equatable {
  final String? date;
  final String? dateId;
  final dynamic startHour;
  final dynamic endHour;
  final dynamic startDay;
  final dynamic endDay;
  final dynamic status;
   String? id;
   String? name;
   String? notes;
   int? no;
   bool? isActive;

   DateDetails(
      {this.date,
      this.dateId,
      required this.startHour,
      required this.endHour,
      required this.startDay,
      required this.endDay,
      this.status,
      this.id,
      this.name,
      this.notes,
      this.no,
      this.isActive});

  @override
  List<Object?> get props =>
      [
        date,
        dateId,
        startHour,
        endHour,
        startDay,
        endDay,
        status,
        id,
        name,
        notes,
        no,
        isActive,
      ];
}