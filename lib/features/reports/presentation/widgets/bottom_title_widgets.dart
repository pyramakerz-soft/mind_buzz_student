import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bottomTitleWidgets(double value, TitleMeta meta, BuildContext context,
    List<String> tprogressKeys) {
  TextStyle? style = Theme.of(context)
      .textTheme
      .displaySmall
      ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600);
  Widget text;

  try {
    text = Text(tprogressKeys[(value - 1).toInt()], style: style);
  } catch (e) {
    text = Text('', style: style);
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    angle: 5,
    child: text,
  );
}
