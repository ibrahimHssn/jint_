import 'package:jint/jint/domain/entities/client_date/client_date.dart';

class ClientDateParameters extends ClientDate {
  final int? pageNumber;
  final int? pageSize;
  final dynamic reservationDate;
  final String? actionType;   // تقوم هذه الدالة بتحديد الرسالة بناءً على نوع العملية

  const ClientDateParameters(
      {
         this.actionType,
            this.pageNumber,
      this.pageSize,
      this.reservationDate,
      super.dateNo,
      super.dateId,
      super.client,
      super.clientId,
      super.status,
      super.id,
      super.name,
      super.notes,
      super.no,
      super.isActive,
      super.createdDate,
      super.createdById,
      super.createdByName,
      super.cancelDate,
      super.cancelById,
      super.cancelByName});
}
