import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/core/widgets/custom_text.dart';

class Utils {
  static Future<void> navigateTo(Widget screen, BuildContext context) async {
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

  static String formatDate(DateTime time) =>
      DateFormat('yyyy-MM-dd').format(time);
  static String parseStringToDate(String time) =>
      formatDate(DateFormat("yyyy-MM-dd").parse(time));

  static popUpLayout(BuildContext context, Widget content, String title) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(10.h),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  topRight: Radius.circular(20.r)),
              boxShadow: [
                BoxShadow(
                    color: AppColor.lightGreyColor,
                    offset: Offset(1, 1),
                    blurRadius: 1,
                    spreadRadius: 1)
              ]),
          child: Row(
            children: [
              CustomText(
                text: title,
                fontWeight: FontWeight.bold,
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.42),
                        color: AppColor.whiteRed),
                    child: Icon(Icons.close),
                  ),
                ),
              )
            ],
          ),
        ),
        10.ph,
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: content,
        ),
      ],
    );
  }
}
