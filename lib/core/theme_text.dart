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
          color: AppColor.lightGreyColor4,
          fontFamily: getFontFamily3(),
        ),
        headlineSmall: TextStyle(
          color: AppColor.greyColor,
          fontFamily: getFontFamily(),
        ),
        bodyMedium: TextStyle(
          color: Colors.black,
          fontFamily: getFontFamily3(),
        ),
        bodySmall: TextStyle(
          color: Colors.white,
          fontFamily: getFontFamily(),
        ),
        titleSmall: TextStyle(
          color: AppColor.darkBlueColor2,
          fontFamily: getFontFamily(),
        ),
        titleMedium: TextStyle(
          color: AppColor.darkBlueColor3,
          fontFamily: getFontFamily(),
        ),
        titleLarge: TextStyle(
          color: AppColor.redColor,
          fontFamily: getFontFamily(),
        ),
        displaySmall: TextStyle(
          color: AppColor.orangeColor,
          fontFamily: getFontFamily(),
        ),
        displayMedium: TextStyle(
          color: AppColor.titleColor,
          fontFamily: getFontFamily(),
        ),
        displayLarge: TextStyle(
          color: AppColor.darkBlueColor,
          fontFamily: getFontFamily(),
        ),
        labelLarge: TextStyle(
          color: AppColor.lightGreyColor3,
          fontFamily: getFontFamily3(),
        )
      ));

  static String getFontFamily() {
    return 'poppinsSemiBold';
  }

  static String getFontFamily2() {
    return 'passionOneRegular';
  }
  static String getFontFamily3() {
    return 'Poppins-Regular';
  }
}
