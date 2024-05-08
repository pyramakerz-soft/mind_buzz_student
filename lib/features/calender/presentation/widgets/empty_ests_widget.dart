

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_color.dart';
import '../../../../core/theme_text.dart';

class EmptyTestsWidget extends StatelessWidget {
  const EmptyTestsWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical:15.h),
      child: Container(
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          color: AppColor.redColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          'You have no assignment on this day',
          style: TextStyle(
              color: AppColor.redColor,
              fontSize: 0.018.sh, fontFamily: AppTheme.getFontFamily3(), fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}
