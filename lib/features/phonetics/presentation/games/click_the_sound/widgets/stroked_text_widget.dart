import 'package:flutter/material.dart';

import '../../../../../../core/app_color.dart';
import '../../../../../../core/theme_text.dart';

class StrokedText extends StatelessWidget {
  final String text;
  final bool isDisabled;
  double? fontSize;
  double? strokeWidth;
  bool? hasShadows;

  StrokedText({
    required this.text,
    required this.isDisabled,
    this.fontSize,
    this.strokeWidth,
    this.hasShadows,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          text,
          style: TextStyle(
            shadows: hasShadows == true
                ? [
                    Shadow(
                      color: AppColor.darkBlueColor6.withOpacity(0.5),
                      blurRadius: 0.0,
                      offset: Offset(2.0, 2.0),
                    ),
                    Shadow(
                      color: AppColor.darkBlueColor6.withOpacity(0.5),
                      blurRadius: 0.0,
                      offset: Offset(-2.0, -3.0),
                    ),
                  ]
                : null,
            fontSize: fontSize ?? 39,
            fontWeight: FontWeight.w900,
            fontFamily: AppTheme.getFontFamily5(),
            foreground: Paint()..color = isDisabled ? AppColor.white.withOpacity(0.5) : AppColor.white,
          ),
        ),
           Text(
          text,
          style: TextStyle(
            fontFamily: AppTheme.getFontFamily5(),
            fontSize: fontSize ?? 39,
            foreground: Paint()
              ..strokeWidth = strokeWidth ?? 1.7
              ..color = isDisabled ? AppColor.lightGreyColor4.withOpacity(0.5) : AppColor.darkBlueColor
              ..style = PaintingStyle.stroke,
          ),
        ),
 
      ],
    );
  }
}
