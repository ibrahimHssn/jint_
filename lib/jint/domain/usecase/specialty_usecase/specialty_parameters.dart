import 'package:equatable/equatable.dart';

class SpecialtyParameters extends Equatable {
 final String? actionType;   // تقوم هذه الدالة بتحديد الرسالة بناءً على نوع العملية
 final int? pageNumber;
  final int? pageSize;
  final String? id;
  final String? name;
  final String? jopName;
  final int? price;
  final String? color;
  final bool? isPublic;
  final String? notes;
  final String? ownerId;
  final String? code;

  const SpecialtyParameters(
      {
       this.actionType,
      this.pageNumber,
      this.pageSize,
      this.id,
      this.name,
      this.jopName,
      this.price,
      this.color,
      this.isPublic,
      this.notes,
      this.ownerId,
      this.code});

  @override
  List<Object?> get props =>
      [id, name, jopName, price, color, isPublic, notes, ownerId, code,];


}
