import 'package:equatable/equatable.dart';
import 'package:jint/jint/domain/entities/user/user.dart';

class ClientDate extends Equatable {
  final int? dateNo;
  final String? dateId;
  final User? client;
  final String? clientId;
  final int? status;
  final String? id;
  final String? name;
  final String? notes;
  final int? no;
  final bool? isActive;
  final String? createdDate;
  final String? createdById;
  final String? createdByName;
  final String? cancelDate;
  final String? cancelById;
  final String? cancelByName;

  const ClientDate(
      {this.dateNo,
      this.dateId,
      this.client,
      this.clientId,
      this.status,
      this.id,
      this.name,
      this.notes,
      this.no,
      this.isActive,
      this.createdDate,
      this.createdById,
      this.createdByName,
      this.cancelDate,
      this.cancelById,
      this.cancelByName});

  @override
  List<Object?> get props =>
      [
        dateNo,
        dateId,
        client,
        clientId,
        status,
        id,
        name,
        notes,
        no,
        isActive,
        createdDate,
        createdById,
        createdByName,
        cancelDate,
        cancelById,
        cancelByName,
      ];
}