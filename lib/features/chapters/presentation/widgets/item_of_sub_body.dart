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
    if (chapterData.isLetter == true) {
      return StrokeText(
        text: chapterData.name ?? '',
        isDisabled: false,
        fontSize: 0.03.sh,
        strokeWidth: 1.5,
      );
    } else if (chapterData.isGame == true) {
      return Text(
        '${chapterData.name ?? 0}',
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: AppColor.darkBlueColor3),
      );
    } else {
      return const SizedBox();
    }
  }
}
