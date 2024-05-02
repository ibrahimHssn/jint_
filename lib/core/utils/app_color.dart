import 'package:flutter/material.dart';
import 'package:jint/core/utils/enums.dart';
class AppColors{
  Color chooseToastColor(ToastStates states) {
    final Map<ToastStates, Color> colorMap = {
      ToastStates.success: Colors.green,
      ToastStates.error: Colors.red,
      ToastStates.info: Colors.blue,
      ToastStates.warning: Colors.amber,
    };

    return colorMap[states] ?? Colors.transparent; // يمكنك تحديد لون افتراضي في حالة عدم العثور على الحالة المحددة
  }
   Color showToastTextColor =Colors.white;

   Color prefixIcon =Colors.grey;

}