import 'package:flutter/material.dart';
import 'package:jint/core/theme/appColor/appColorDark.dart';
import 'package:jint/core/theme/themeData/themeDataDark.dart';

import 'app_constance.dart';

class BuildDefaultButton{
  Widget button({
    required bool condition,
    required VoidCallback onTap,
    required String text,
    required BuildContext context

  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 50.0,
                width: 120.0,
                decoration: const BoxDecoration(
                  color: AppColorsDark.buttonColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22.0),
                    topLeft: Radius.circular(22.0),
                    bottomRight: Radius.circular(200.0),
                  ),
                ),
                child: condition
                    ? Center(
                  child: Text(
                    text,
                    style: context.styleHeader3.copyWith(fontSize: 20,fontWeight: FontWeight.w700),
                  ),
                )
                    :AppConstance().circularProgress(),
              ),
            ),
            const SizedBox(width: 8),
            // const Icon(
            //   Icons.app_registration,
            //   color: Colors.black,
            // ),
          ],
        ),
      ),
    );
  }



  buildDefaultTextButton({
    required VoidCallback onPressed,
    required String text,
    double fontSize = 12,
    Color? backgroundColor,
    TextDecoration? textDecoration,
  }) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          decoration: textDecoration,
        ),
      ),
    );
  }



}