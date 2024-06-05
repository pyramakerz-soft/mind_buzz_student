import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/phonetics/assets_images_phonetics.dart';

class ItemCardWidgetOFSortingCups extends StatelessWidget {
  final double? width;
  final double? height;
  final void Function()? onTap;
  final bool hide;
  final String body;

  const ItemCardWidgetOFSortingCups(
      {Key? key,
      this.width,
      this.height,
      required this.body,
      this.onTap,
      required this.hide})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final countOfFingers = context
    //     .select((StartGameProvider value) => value.touchPositions.length);
    // final ttsState =
    //     context.select((StartGameProvider value) => value.ttsState);
    return GestureDetector(
      child: Container(
        width: width ?? 56,
        height: height ?? 89.85,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(AppImagesPhonetics.iconBoarderOfChar,
                fit: BoxFit.fitWidth, width: width, height: height),
            Text(
              body,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: 18.sp, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
