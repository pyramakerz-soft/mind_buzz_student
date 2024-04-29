import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/assets_svg_images.dart';
import '../../../../core/vars.dart';
import '../../domain/entities/chapter_model.dart';

class ItemOfSubBody extends StatelessWidget {
  final ChapterModel chapterData;

  const ItemOfSubBody({Key? key, required this.chapterData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (chapterData.isChapter == true) {
      if (chapterData.isOpen == true) {
        return Text(
          "1",
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: 25, fontWeight: FontWeight.w700),
        );
      } else {
        return SvgPicture.asset(AppSvgImages.iconLock);
      }
    }
    else if (chapterData.isCheckPoint == true) {
      if (chapterData.isOpen == true) {
        return const SizedBox();
      } else {
        return SvgPicture.asset(AppSvgImages.iconLock);
      }
    }
    else if (chapterData.isAssessment == true) {
      if (chapterData.isOpen == true) {
        return const SizedBox();
      } else {
        return SvgPicture.asset(AppSvgImages.iconLock);
      }
    }
    else if (chapterData.isLesson == true) {
      if (chapterData.isOpen == true) {
        return Column(
          children: [
            Text(
              "Lesson",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            ...List.generate(
                1,
                (index) => SvgPicture.asset(
                      DefaultChapterData.getTheNumberOfChapter(
                        number: chapterData.number??0,
                      ).first,
                      height: 20,
                    ))
          ],
        );
      } else {
        return const SizedBox();
      }
    }
    else {
      return const SizedBox();
    }
  }
}
