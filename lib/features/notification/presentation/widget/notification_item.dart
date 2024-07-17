import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/parent_assets.dart';
import 'package:mind_buzz_refactor/core/theme_text.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/notification/domain/entities/notification_item_model.dart';

enum CoursesEnum { math, phonics, arabic, culture, practicalLife, unknown }

extension TypeExtension on CoursesEnum {
  String get name {
    switch (this) {
      case CoursesEnum.math:
        return 'Math';
      case CoursesEnum.phonics:
        return 'Phonics';
      case CoursesEnum.arabic:
        return 'Arabic';
      case CoursesEnum.culture:
        return 'Culture';
      case CoursesEnum.practicalLife:
        return 'Practical Life';
      case CoursesEnum.unknown:
        return 'Unknown';
    }
  }

  Color get color {
    switch (this) {
      case CoursesEnum.math:
        return AppColor.mathColor;
      case CoursesEnum.phonics:
        return AppColor.phonicsColor;
      case CoursesEnum.arabic:
        return AppColor.arabicColor;
      case CoursesEnum.culture:
        return AppColor.cultureColor;
      case CoursesEnum.practicalLife:
        return AppColor.practicalLifeColor;
      case CoursesEnum.unknown:
        return AppColor.practicalLifeColor;
    }
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.notification});
  final NotificationItemModel notification;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: ShapeDecoration(
        color: notification.isRead == 1
            ? const Color(0xFFFAFAFA)
            : const Color(0xFFE6EDF2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        shadows: [
          BoxShadow(
            color: const Color(0x14000000),
            blurRadius: 8.r,
            offset: const Offset(0, 1),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          5.ph,
          _buildTitleAndCourseName(context),
          20.ph,
          _buildStartAndEndDate(),
          5.ph,
        ],
      ),
    );
  }

  Widget _buildTitleAndCourseName(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FittedBox(
            child: Text(
              notification.assignmentName ?? '',
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
        Flexible(
          child: FittedBox(
              child: Container(
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              color: CoursesEnum.values
                  .firstWhere((e) =>
                      e.name.contains(notification.courseName ?? 'unknown'))
                  .color
                  .withOpacity(0.2),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              CoursesEnum.values
                  .firstWhere((e) =>
                      e.name.contains(notification.courseName ?? 'unknown'))
                  .name,
              style: TextStyle(
                  color: CoursesEnum.values
                      .firstWhere((e) =>
                          e.name.contains(notification.courseName ?? 'unknown'))
                      .color,
                  fontSize: 12.sp,
                  fontFamily: AppTheme.getFontFamily3(),
                  fontWeight: FontWeight.w500),
            ),
          )),
        ),
      ],
    );
  }

  Widget _buildStartAndEndDate() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: FittedBox(
            child: Row(
              children: [
                SvgPicture.asset(
                  ParentImages.calenderOutline,
                  height: 13.h,
                  color: AppColor.lightGreyColor3,
                ),
                5.pw,
                Text(
                  'Start on ',
                  style: TextStyle(
                      color: AppColor.lightGreyColor3,
                      fontSize: 12.sp,
                      fontFamily: AppTheme.getFontFamily3(),
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  _getFormattedDate(notification.startDate),
                  style: TextStyle(
                      color: AppColor.lightGreyColor3.withOpacity(0.7),
                      fontSize: 10.sp,
                      fontFamily: AppTheme.getFontFamily3(),
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: FittedBox(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  ParentImages.timers,
                  height: 13.h,
                  color: AppColor.lightGreyColor3,
                ),
                5.pw,
                Text(
                  'Deadline ',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColor.lightGreyColor3,
                    fontFamily: AppTheme.getFontFamily3(),
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  _getFormattedDate(notification.dueDate),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10.sp,
                    color: AppColor.lightGreyColor3.withOpacity(0.7),
                    fontFamily: AppTheme.getFontFamily3(),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  String _getFormattedDate(String? date) {
    if (date == null || date.isEmpty) {
      return 'Invalid Date'; // or return a default value like 'Invalid date'
    }

    try {
      DateTime dateTime = DateTime.parse(date);
      String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
      return formattedDate;
    } catch (e) {
      return 'Invalid Date'; // or handle the exception as needed
    }
  }
}
