import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bottomTitleWidgets(double value, TitleMeta meta, BuildContext context) {
  TextStyle? style = Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600);
  Widget text;
  switch (value.toInt()) {
    case 1:
      text =  Text('jan', style: style);
      break;
    case 2:
      text =  Text('feb', style: style);
      break;
    case 3:
      text =  Text('mar', style: style);
      break;
    case 4:
      text =  Text('april', style: style);
      break;
    case 5:
      text =  Text('may', style: style);
      break;
    case 6:
      text =  Text('june', style: style);
      break;
    case 7:
      text =  Text('aug', style: style);
      break;
    case 8:
      text =  Text('sep', style: style);
      break;
    case 9:
      text =  Text('oct', style: style);
      break;
    case 10:
      text =  Text('nov', style: style);
      break;
    case 11:
      text =  Text('xxx', style: style);
      break;
    case 12:
      text =  Text('dec', style: style);
      break;
    default:
      text =  Text('', style: style);
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    angle: 5,
    child: text,
  );
}
