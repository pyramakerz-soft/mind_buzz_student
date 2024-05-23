import 'package:flutter/material.dart';

import '../app_color.dart';
import '../theme_text.dart';

class StrokeText extends StatelessWidget {
  final String text;
  final isDisabled;
  final double ?fontSize;
  final double ?strokeWidth;
  final Color ?color;
  final Color ?strokeColor;
  const StrokeText({
    required this.text,
    required this.isDisabled,
    this.strokeWidth,
    this.fontSize,
    this.color,
    this.strokeColor
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize:fontSize?? 39,
            fontFamily:  AppTheme.getFontFamily5(),
            foreground: Paint()..color =  color!=null? color! : isDisabled ? AppColor.white.withOpacity(0.5) : AppColor.white,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            fontFamily:  AppTheme.getFontFamily5(),
            fontSize: fontSize?? 39,
            foreground: Paint()
              ..strokeWidth = strokeWidth ?? 2
              ..color = strokeColor!=null? strokeColor! : isDisabled ? AppColor.lightGreyColor4.withOpacity(0.5) :AppColor.darkBlueColor
              ..style = PaintingStyle.stroke,
          ),


        ),




      ],
    );
  }
}