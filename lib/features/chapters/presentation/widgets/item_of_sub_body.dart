import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

import '../../../../core/assets_svg_images.dart';
import '../../../../core/vars.dart';
import '../../../../core/widgets/stroke_text.dart';

import '../../domain/entities/chapter_model.dart';

class ItemOfSubBody extends StatelessWidget {
  final ChapterModel chapterData;

  const ItemOfSubBody({Key? key, required this.chapterData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;
    if (chapterData.isLetter == true) {
      return SizedBox(
          width: 125,
          child: FittedBox(
            child: StrokeText(
              text: chapterData.name ?? '',
              isDisabled: false,
              fontSize: 0.03.sh,
              strokeWidth: 1.5,
            ),
          ));
    } else if (chapterData.isGame == true) {
      return SizedBox(
        width: 125,
        child: Text(
          '${chapterData.name ?? 0}',
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontSize: useMobileLayout ? 14.sp : 10.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.darkBlueColor3),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
