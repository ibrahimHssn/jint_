import 'package:flutter/material.dart';
import 'package:jint/core/theme/appColor/appColorDark.dart';

ThemeData getThemeDataDark() {
  return ThemeData(
    primaryColor: AppColorsDark.primaryColor,
    scaffoldBackgroundColor: AppColorsDark.backgroundColor,
    appBarTheme: const AppBarTheme(
      color: AppColorsDark.appBarColor,
      elevation: 0.0,
      iconTheme: IconThemeData(color: AppColorsDark.iconThemeAppBarColor),
    ),
  );
}

extension ThemeExtension on BuildContext {
  TextTheme get  textTheme =>Theme.of(this).textTheme;
  TextStyle get styleHeader1 => textTheme.displayLarge!.copyWith(color: AppColorsDark.textThemeColor);
  TextStyle get styleHeader2 => textTheme.displayMedium!.copyWith(color: AppColorsDark.textThemeColor);
  TextStyle get styleHeader3 => textTheme.displaySmall!.copyWith(color: AppColorsDark.textThemeColor);

  TextStyle get styleSubtitle => textTheme.displayLarge!.copyWith(color: AppColorsDark.textThemeColor);
  TextStyle get styleBodyBold=> textTheme.displayMedium!.copyWith(color: AppColorsDark.textThemeColor);
  TextStyle get styleBodySmall => textTheme.displaySmall!.copyWith(color: AppColorsDark.textThemeColor);
}
