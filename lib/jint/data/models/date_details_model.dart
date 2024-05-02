import 'package:jint/jint/domain/entities/date_details/date_details.dart';

class DateDetailsModel extends DateDetails{
   DateDetailsModel({required super.date, required super.dateId, required super.startHour, required super.endHour, required super.startDay, required super.endDay, required super.status, required super.id, required super.name, required super.notes, required super.no, required super.isActive});

  factory DateDetailsModel.fromJson(Map<String, dynamic> json) =>
      DateDetailsModel(
          date: json['date']??"",
          dateId: json['dateId']??"",
          startHour: json['startHour']??"",
          endHour: json['endHour']??"",
          startDay: json['startDay']??"",
          endDay: json['endDay']??"",
          status: json['status']??"",
          id: json['id']??"",
          name: json['name']??"",
          notes: json['notes']??"",
          no: json['no']??0,
          isActive: json['isActive']??false);
}