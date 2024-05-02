import 'package:equatable/equatable.dart';
import 'package:jint/jint/domain/entities/date/date.dart';
import 'package:jint/jint/domain/entities/secretaries/secretaries.dart';
import 'package:jint/jint/domain/entities/user/user.dart';

class Specialty extends Equatable {
  final String code;
  final List<Date> dates;
  final User owner;
  final String ownerId;
  final List<Secretaries> secretaries;
  final bool isPublic;
  final String color;
  final int price;
  final String jopId;
  final String jopName;
  final String id;
  final String name;
  final String notes;
  final String createdDate;

  const Specialty(
      {required this.code, required this.dates, required this.owner, required this.ownerId, required this.secretaries, required this.isPublic, required this.color, required this.price, required this.jopId, required this.jopName, required this.id, required this.name, required this.notes, required this.createdDate});


  @override
  List<Object> get props =>
      [
        code,
        dates,
        owner,
        ownerId,
        secretaries,
        isPublic,
        color,
        price,
        jopId,
        jopName,
        id,
        name,
        notes,
        createdDate,
      ];

}