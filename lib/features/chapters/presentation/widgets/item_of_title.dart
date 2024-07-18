import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    if (chapterData.isActive == true || chapterData.isGame == false) {
      if (chapterData.star != null) {
        return Row(
          children: List.generate(
              3,
              (index) => (double.parse("${chapterData.star ?? 0}") > (index))
                  ? Padding(
                      padding: EdgeInsets.only(bottom: index == 1 ? 10.h : 0.h),
                      child: SvgPicture.asset(
                        AppSvgImages.iconCompleteStar,
                        height: (chapterData.isGame ?? false) ? 18.h : 18.h,
                      ),
                    )
                  : Padding(
                      padding: EdgeInsets.only(bottom: index == 1 ? 10.h : 0),
                      child: Image.asset(
                        AppImages.iconEmptyStar,
                        height: (chapterData.isGame ?? false) ? 18.h : 18.h,
                      ),
                    )),
        );
      } else {
        return Row(
          children: List.generate(
              3,
              (index) => Padding(
                    padding: EdgeInsets.only(bottom: index == 1 ? 10.h : 0),
                    child: (SvgPicture.asset(
                      AppSvgImages.iconEmptyStar,
                      height: (chapterData.isGame ?? false) ? 18.h : 18.h,
                    )),
                  )),
        );
      }
    } else {
      return Padding(
        padding: EdgeInsets.all(8.w),
        child: Image.asset(
          AppImages.lock,
          height: 25.h,
        ),
      );
    }
  }
}
