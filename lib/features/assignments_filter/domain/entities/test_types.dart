import 'package:flutter/material.dart';

class AppColorModels {
  static const Color resetText = Color(0xff008D4B);
  static const Color redColor4 = Color(0xFFE03138);
  static const Color lightGreyColor5 = Color(0xFFCCCCCC);
}

class TestTypes {
  static String finished = 'Finished';
  static String dueSoon = 'Due Soon';
  static String notStarted = 'Not Started';
  static String overdue = 'Overdue';
  static List listOfTestTypes = [finished, dueSoon, notStarted, overdue];
  static List listOfTestColors = [
    AppColorModels.resetText,
    AppColorModels.redColor4,
    AppColorModels.lightGreyColor5,
    Colors.black
  ];
}
