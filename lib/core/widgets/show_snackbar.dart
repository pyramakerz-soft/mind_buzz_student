import 'package:flutter/material.dart';

void showSnackBar(
  BuildContext context, {
  required dynamic message,
  Widget? action,
  EdgeInsetsGeometry? margin = const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 32.0),
  Duration snackBarDuration = const Duration(seconds: 4),
  Color? textColor,
  Color? backgroundColor,
  TextStyle? textStyle,
}) {
  final scaffoldMessenger = ScaffoldMessenger.maybeOf(context);
  if (scaffoldMessenger == null) return;

  scaffoldMessenger.clearSnackBars();

  message = message.toString();

  final snackBar = SnackBar(
      duration: snackBarDuration,
      margin: margin,
      behavior: SnackBarBehavior.floating,
      backgroundColor: backgroundColor,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              (message as String),
              style: textStyle ??
                  Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: textColor),
            ),
          ),
          if (action != null) action,
        ],
      ));

  scaffoldMessenger.showSnackBar(snackBar);
}
