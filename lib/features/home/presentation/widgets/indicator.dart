import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

class Indicator extends StatelessWidget {
  const Indicator({
    super.key,
    required this.color,
    this.percentageColor,
    required this.title,
    this.percentage,
    required this.isSquare,
    this.size = 16,
    this.textColor,
  });
  final Color color;
  final Color? percentageColor;
  final String title;
  final double? percentage;
  final bool isSquare;
  final double size;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Row(
            children: [
              Flexible(
                child: FittedBox(
                  child: Text(
                    "$percentage%",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: percentageColor,
                    ),
                  ),
                ),
              ),
              5.pw,
              Flexible(
                child: FittedBox(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: percentageColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
