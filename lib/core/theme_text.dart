import 'package:flutter/material.dart';

import 'app_color.dart';

class AppTheme {
  final ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      primaryColor: AppColor.lightBlueColor,
      dividerColor: AppColor.dividerColor,
      fontFamily: getFontFamily3(),
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
            fontFamily: getFontFamily3(),
          ),
          bodyMedium: TextStyle(
            color: Colors.black,
            fontFamily: getFontFamily3(),
          ),
          bodySmall: TextStyle(
            color: Colors.white,
            fontFamily: getFontFamily3(),
          ),
          titleSmall: TextStyle(
            color: AppColor.darkBlueColor2,
            fontFamily: getFontFamily(),
          ),
          titleMedium: TextStyle(
            color: AppColor.blackRedColor,
            fontFamily: getFontFamily(),
          ),
          titleLarge: TextStyle(
            color: AppColor.redColor,
            fontFamily: getFontFamily3(),
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
            fontFamily: getFontFamily3(),
          ),
          labelLarge: TextStyle(
            color: AppColor.lightGreyColor3,
            fontFamily: getFontFamily3(),
          )));

  static String getFontFamily() {
    return 'poppinsSemiBold';
  }

  static String getFontFamily2() {
    return 'passionOneRegular';
  }

  static String getFontFamily3() {
    return 'Poppins-Regular';
  }
  static String getFontFamily4() {
    return 'Roboto-Medium';
  }
}
