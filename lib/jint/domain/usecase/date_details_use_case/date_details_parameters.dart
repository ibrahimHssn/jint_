
import 'package:jint/jint/domain/entities/date_details/date_details.dart';

class DateDetailsParameters extends DateDetails {
  final String? actionType;   // تقوم هذه الدالة بتحديد الرسالة بناءً على نوع العملية

   DateDetailsParameters(
      {
      this.actionType,
        super.date,
       super.dateId,
       super.startHour,
       super.endHour,
       super.startDay,
       super.endDay,
       super.status,
       super.id,
       super.name,
       super.notes,
       super.no,
       super.isActive});
}