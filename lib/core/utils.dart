import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Utils {
  static void navigateTo(Widget screen, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }

  static void navigateAndRemoveUntilTo(Widget child, BuildContext context,
          {bool rootNavigator = false}) async =>
      Navigator.of(context, rootNavigator: rootNavigator).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (_) => child,
          ),
          (route) => false);

  static void navigateToAndReplacement(Widget child, BuildContext context) =>
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => child));

  static void showCustomBottomSheet(
    Widget child,
    BuildContext context,
  ) =>
      showModalBottomSheet(
        context: context,
        elevation: 0,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
          ),
        ),
        builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: child,
        ),
      );

  static String formatDate(DateTime time)=>  DateFormat('yyyy-MM-dd').format(time);
  static String parseStringToDate(String time)=>  formatDate(DateFormat("yyyy-MM-dd").parse(time));
}
