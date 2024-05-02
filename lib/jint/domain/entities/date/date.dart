import 'package:equatable/equatable.dart';
import 'package:jint/jint/domain/entities/addresss.dart';
import 'package:jint/jint/domain/entities/client_date/client_date.dart';
import 'package:jint/jint/domain/entities/date_details/date_details.dart';

class Date extends Equatable {
  final String startDate;
  final String endDate;
  final bool isEndDate;
  final String specialtyId;
  final Address address;
  final int dateType;
  final List<DateDetails> dateDetails;
  final List<ClientDate> clientDate;
  final int status;
  final String id;
  final String name;
  final String notes;
  final int no;
  final String createdDate;
  final int maxClientDateNo;
  final bool isByGroub;
  final bool isContinuous;
  final DateTime startDateTime;
  final DateTime endDateTime;

  const Date(
      {required this.startDate, required this.endDate, required this.isEndDate, required this.specialtyId, required this.address, required this.dateType, required this.dateDetails, required this.clientDate, required this.status, required this.id, required this.name, required this.notes, required this.no, required this.createdDate, required this.maxClientDateNo, required this.isByGroub, required this.isContinuous, required this.startDateTime, required this.endDateTime});

  @override
  List<Object> get props =>
      [
        startDate,
        endDate,
        isEndDate,
        specialtyId,
        address,
        dateType,
        dateDetails,
        clientDate,
        status,
        id,
        name,
        notes,
        no,
        createdDate,
        maxClientDateNo,
        isByGroub,
        isContinuous,
        startDateTime,
        endDateTime,
      ];
}