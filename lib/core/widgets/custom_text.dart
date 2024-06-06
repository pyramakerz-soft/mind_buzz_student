import 'dart:ui';

import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign? align;

  const CustomText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.fontSize,
      this.fontWeight = FontWeight.normal,
      this.align});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          color: color, fontWeight: fontWeight, fontSize: fontSize ?? 0.02.sh),
    );
  }
}
