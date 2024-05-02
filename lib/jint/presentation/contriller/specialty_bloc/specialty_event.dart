import 'package:equatable/equatable.dart';

abstract class SpecialtyEvent extends Equatable {
  const SpecialtyEvent();
}


class GetSpecialtyEvent extends SpecialtyEvent {
  final int pageNumber;
  final int pageSize;

  const GetSpecialtyEvent({required this.pageNumber, required this.pageSize});

  @override
  List<Object> get props => [pageNumber, pageSize];
}


class AddSpecialtyEvent extends SpecialtyEvent {
  final String name;
  final String jopName;
  final int? price;
  final String? color;
  final bool? isPublic;
  final String? notes;
  final String? ownerId;
  final String? code;

  const AddSpecialtyEvent(
      {required this.name, required this.jopName, this.price, this.color, this.isPublic, this.notes, this.ownerId, this.code});

  @override
  List<Object?> get props =>
      [name, jopName, price, color, isPublic, notes, ownerId, code,];
}


class UpdateSpecialtyEvent extends SpecialtyEvent {
  final String? id;
  final String? name;
  final String? jopName;
  final int? price;
  final String? color;
  final bool? isPublic;
  final String? notes;
  final String? ownerId;
  final String? code;

  const UpdateSpecialtyEvent(
      {required this.id, this.name, required this.jopName, this.price, this.color, this.isPublic, this.notes, this.ownerId, this.code});

  @override
  List<Object?> get props =>
      [id, name, jopName, price, color, isPublic, notes, ownerId, code,];
}


class DeleteSpecialtyEvent extends SpecialtyEvent {
  final String specialtyId;

  const DeleteSpecialtyEvent({required this.specialtyId});

  @override
  List<Object> get props => [specialtyId];
}
