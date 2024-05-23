import 'package:flutter/material.dart';

import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../../../core/widgets/stroke_text.dart';
import '../../click_the_sound/pages/click_the_sound_game.dart';

class ItemCardWidget extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final void Function()? onTap;
  final String body;
  final bool? hide;

  const ItemCardWidget(
      {Key? key,
      required this.maxWidth,
      this.hide,
      required this.maxHeight,
      required this.body,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: maxWidth / 3,
      height: maxHeight / 3,
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: maxWidth / 3,
              height: maxHeight / 3,
              // padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 36),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.87, color: Color(0xFF91D4F0)),
                ),
              ),
              alignment: Alignment.center,
              child: StrokeText(
                text: body,
                isDisabled: false,
              ),
            ),
          ),
          if (hide == true) ...{
            Container(
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColorPhonetics.DarkBorderColor),
            )
          }
        ],
      ),
    );
  }
}
