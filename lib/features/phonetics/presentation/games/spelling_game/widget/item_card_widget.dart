import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../../../core/widgets/stroke_text.dart';
import '../../click_the_sound/pages/click_the_sound_game.dart';

class ItemCardWidget extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final void Function()? onTap;
  final String body;
  final int index;
  final int id;

  const ItemCardWidget(
      {Key? key,
      required this.maxWidth,
      required this.maxHeight,
      required this.body,
      this.onTap,
      required this.index,
  required this.id})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Draggable<String>(
      // Data is the value this Draggable stores.
      data: body,

      feedback: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 70.0,
          width: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColor.darkBlueColor,
          ),
          child: Center(
            child: Text(
              body,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 0.05.sw,
                  decoration: TextDecoration.none),
            ),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Container(
            height: maxHeight,
            width: maxHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColor.darkBlueColor,
          ),
          child: Center(
            child: Text(
              body,
              style: TextStyle(color: Colors.white, fontSize: 0.025.sw,
                fontWeight: FontWeight.w900
              ),
            ),
          ),
        ),
      ),
    );
  }
}
