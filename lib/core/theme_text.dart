import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      brightness: Brightness.light,
      primaryColor: AppColor.lightBlueColor,
      fontFamily: getFontFamily(),
      textTheme: TextTheme(
          headlineLarge: TextStyle(
            color: Colors.black,
            fontFamily: getFontFamily(),
          ),
          headlineMedium: TextStyle(
            color: AppColor.brownColor,
            fontFamily: getFontFamily(),
          ),
          headlineSmall: TextStyle(
            color: AppColor.greyColor,
            fontFamily: getFontFamily(),
          ),
        bodyMedium: TextStyle(
          color: AppColor.brownColor4,
          fontFamily: getFontFamily2(),
        ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontFamily: getFontFamily(),
          ),
        titleSmall: TextStyle(
          color: AppColor.darkBlueColor2,
          fontFamily: getFontFamily(),
        )
      ));

  static String getFontFamily() {
    return 'poppinsSemiBold';
  }
  static String getFontFamily2() {
    return 'passionOneRegular';
  }
}
