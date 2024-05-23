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
  final int index;

  const ItemCardWidget(
      {Key? key,
      required this.maxWidth,
      this.hide,
      required this.maxHeight,
      required this.body,
      this.onTap,
      required this.index})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              decoration: BoxDecoration(
                color: Colors.white,
                // shape: RoundedRectangleBorder(
                //   side: BorderSide(width: 2, Color(0xFF91D4F0)),
                // ),
                border: Border(
                  right: (index == 0 || index == 3 || index == 6)
                      ? const BorderSide(width: 2, color: Color(0xFF91D4F0))
                      : const BorderSide(color: Colors.white),
                  left: (index == 2 || index == 5 || index == 8)
                      ? const BorderSide(width: 2, color: Color(0xFF91D4F0))
                      : const BorderSide(color: Colors.white),
                  top: (index == 6 || index == 7 || index == 8)
                      ? const BorderSide(width: 2, color: Color(0xFF91D4F0))
                      : const BorderSide(color: Colors.white),
                  bottom: (index == 0 || index == 1 || index == 2)
                      ? const BorderSide(width: 2, color: Color(0xFF91D4F0))
                      : const BorderSide(color: Colors.white),
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
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColorPhonetics.DarkBorderColor),
            )
          }
        ],
      ),
    );
  }
}
