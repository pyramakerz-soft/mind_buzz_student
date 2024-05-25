import 'package:flutter/material.dart';

import '../../../../../../core/phonetics/phonetics_color.dart';
import '../../../../../../core/widgets/stroke_text.dart';
import '../../click_the_sound/pages/click_the_sound_game.dart';

class ItemCardWidget extends StatelessWidget {
  final double maxWidth;
  final double maxHeight;
  final void Function()? onTap;
  final String body;
  final int index;

  const ItemCardWidget(
      {Key? key,
      required this.maxWidth,
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
      child: Container(
        child: Text(body),
      ),
    );
  }
}
