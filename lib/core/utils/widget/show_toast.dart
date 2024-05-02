import 'package:jint/core/utils/app_color.dart';
import 'package:jint/core/utils/enums.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowToast{
   showToast({required String message, required ToastStates states,}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 40,
      backgroundColor:AppColors().chooseToastColor(states),
      textColor: AppColors().showToastTextColor,
      fontSize: 16.0,
    );

  }

}