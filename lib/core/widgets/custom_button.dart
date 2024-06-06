import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/widgets/custom_text.dart';

import '../app_color.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final bool fill;
  const CustomButton(
      {super.key,
      required this.title,
      this.width,
      this.height,
      this.onTap,
      this.fill = true,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap?.call,
      child: Container(
        height: height ?? 0.06.sh,
        width: width ?? 0.25.sw,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColor.darkBlueColor),
            color: fill ? AppColor.darkBlueColor : Colors.white),
        child: Center(
          child: CustomText(
            text: title,
            color: titleColor ?? (fill ? Colors.white : AppColor.darkBlueColor),
            fontSize: 0.018.sh,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
