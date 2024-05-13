import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/assets_images.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/vars.dart';
import '../../domain/entities/chapter_model.dart';

class ItemOfTitle extends StatelessWidget {
  final ChapterModel chapterData;

  const ItemOfTitle({Key? key, required this.chapterData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (chapterData.isCheckPoint == true) {
      return Text(
        'CheckPoint',
        style: Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
      );
    } else if (chapterData.isAssessment == true) {
      return Text(
        'Assessment',
        style: Theme.of(context)
            .textTheme
            .displayMedium
            ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
      );
    } else if (chapterData.isLesson == true) {
      if (chapterData.isOpen == true) {
        return Row(
          children: List.generate(
              3,
              (index) => (double.parse("${chapterData.star ?? 0}") > (index))
                  ? SvgPicture.asset(
                      AppSvgImages.iconCompleteStar,
                      height: 25,
                    )
                  : Image.asset(
                      AppImages.iconEmptyStar,
                      height: 25,
                    )),
        );
      } else {
        return Row(
          children: List.generate(
              3,
              (index) => (SvgPicture.asset(
                    AppSvgImages.iconEmptyStar,
                    height: 25,
                  ))),
        );
      }
    } else {
      return const SizedBox();
    }
  }
}
