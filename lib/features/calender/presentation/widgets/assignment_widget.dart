import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/assets_svg_images.dart';
import 'package:mind_buzz_refactor/core/parent_assets.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:intl/intl.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/test_model.dart';

import '../../../../core/app_color.dart';
import '../../../../core/enums/assignment_status.dart';
import '../../../../core/theme_text.dart';

class AssignmentWidget extends StatelessWidget {
  final TestModel singleTest;
  final bool isAssignment;
  const AssignmentWidget(
      {Key? key, required this.singleTest, this.isAssignment = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 7.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border(
            left: BorderSide(
                width: 6,
                color: isAssignment
                    ? getStatusColor(singleTest.status)
                    : getStarColor(singleTest.star)),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x14000000),
              blurRadius: 8,
              offset: Offset(0, 1),
              spreadRadius: 0,
            )
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(isAssignment==true)...{
              Text(
                singleTest.testName ?? '',
                style: Theme
                    .of(context)
                    .textTheme
                    .displayLarge
                    ?.copyWith(
                    fontSize: 0.016.sh,
                    fontWeight: FontWeight.bold,
                    height: 0,
                    letterSpacing: 0.44,
                    overflow: TextOverflow.ellipsis),
              ),
            },
            isAssignment
                ? SizedBox(
                    width: MediaQuery.of(context).size.width - 70,
                    child: Text(
                      isAssignment
                          ? singleTest.programName ?? ''
                          : singleTest.testName ?? '',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                          fontSize: 0.016.sh,
                          fontWeight: FontWeight.bold,
                          height: 0,
                          letterSpacing: 0.44,
                          overflow: TextOverflow.ellipsis),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: FittedBox(
                          child: Text(
                            singleTest.testName ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(
                                    fontSize: 0.016.sh,
                                    fontWeight: FontWeight.bold,
                                    height: 0,
                                    letterSpacing: 0.44,
                                    overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ),
                      Flexible(
                        child: FittedBox(
                            child: _StarRow(
                          stars: int.parse(singleTest.star ?? '1'),
                        )),
                      )
                    ],
                  ),

            // Padding(
            //   padding: EdgeInsets.symmetric(vertical: 7.h),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Text(
            //           singleTest.chapterName ?? '',
            //           style: Theme.of(context).textTheme.displayLarge?.copyWith(
            //               fontSize: 0.02.sh,
            //               fontWeight: FontWeight.bold,
            //               height: 0,
            //               letterSpacing: 0.44,
            //               overflow: TextOverflow.ellipsis),
            //         ),
            //       ),
            //       Container(
            //         padding:
            //             const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(12.r),
            //           color: AssignmentStatus.values
            //               .firstWhere(
            //                   (element) => element.text() == singleTest.status)
            //               .color()
            //               .withOpacity(0.2),
            //         ),
            //         child: Text(
            //           singleTest.status ?? '',
            //           style: Theme.of(context).textTheme.displayLarge?.copyWith(
            //               fontSize: 0.015.sh,
            //               fontWeight: FontWeight.bold,
            //               color: AssignmentStatus.values
            //                   .firstWhere((element) =>
            //                       element.text() == singleTest.status)
            //                   .color(),
            //               height: 0,
            //               letterSpacing: 0.44,
            //               overflow: TextOverflow.ellipsis),
            //         ),
            //       )
            //     ],
            //   ),
            // ),
            isAssignment
                ? Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: FittedBox(
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    ParentImages.calenderOutline,
                                    height: 13,
                                  ),
                                  5.pw,
                                  Text(
                                    getStartDateText(singleTest),
                                    style: TextStyle(
                                        color: AppColor.lightGreyColor3,
                                        fontSize: 12,
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
                                    height: 13,
                                  ),
                                  5.pw,
                                  Text(
                                    getEndDateText(singleTest.status),
                                    style: TextStyle(
                                      color: AppColor.lightGreyColor3
                                          .withOpacity(0.7),
                                      fontSize: 12,
                                      fontFamily: AppTheme.getFontFamily3(),
                                    ),
                                  ),
                                  Text(
                                    singleTest.status !=
                                            AssignmentStatus.overdue.text()
                                        ? singleTest.daysLeft ?? ''
                                        : singleTest.daysDifference ?? '',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: singleTest.status !=
                                                AssignmentStatus.overdue.text()
                                            ? AppColor.lightGreyColor3
                                            : getStatusColor(singleTest.status),
                                        fontSize: 12,
                                        fontFamily: AppTheme.getFontFamily3(),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                : Column(
                    children: [
                      const SizedBox(height: 5),
                      Divider(
                        height: 0.3,
                        color: AppColor.greyColor.withOpacity(0.5),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: FittedBox(
                              child: Row(
                                children: [
                                  Text(
                                    'Chapter : ${singleTest.chapterName ?? ''}',
                                    style: TextStyle(
                                        color: AppColor.lightGreyColor3,
                                        fontSize: 12,
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
                                  Text(
                                    'Lesson : ${singleTest.lessonName ?? ''}',
                                    style: TextStyle(
                                      color: AppColor.lightGreyColor3
                                          .withOpacity(0.7),
                                      fontSize: 12,
                                      fontFamily: AppTheme.getFontFamily3(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: FittedBox(
                              child: Row(
                                children: [
                                  Text(
                                    'Game : ${singleTest.gameName ?? ''}',
                                    style: TextStyle(
                                        color: AppColor.lightGreyColor3,
                                        fontSize: 12,
                                        fontFamily: AppTheme.getFontFamily3(),
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(),
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  String getEndDateText(String status) {
    if (status == AssignmentStatus.pending.text()) {
      return 'End Date ';
    } else if (status == AssignmentStatus.overdue.text()) {
      return 'Time Different ';
    } else {
      return 'Deadline ';
    }
  }

  String getStartDateText(TestModel singleTest) {
    if (singleTest.status == AssignmentStatus.pending.text()) {
      DateTime dateTime = DateTime.parse(singleTest.createdAt ?? '');
      String formattedDate = DateFormat('d MMMM').format(dateTime);
      return 'Start Date $formattedDate';
    } else if (singleTest.status == AssignmentStatus.overdue.text()) {
      return 'Deadline ${singleTest.daysLeft ?? ''}';
    } else {
      return 'Date of Completion ${singleTest.daysLeft ?? ''}';
    }
  }

  Color getStatusColor(String status) {
    if (status == AssignmentStatus.completed.text()) {
      return AppColor.resetText;
    } else if (status == AssignmentStatus.pending.text()) {
      return AppColor.darkBlueColor;
    } else {
      return AppColor.redColor4;
    }
  }

  Color getStarColor(String? star) {
    if (star == '3') {
      return AppColor.resetText;
    } else if (star == '2') {
      return AppColor.darkBlueColor;
    } else {
      return AppColor.redColor4;
    }
  }
}

class _StarRow extends StatelessWidget {
  final int stars;

  _StarRow({required this.stars});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        Color color;
        if (index + 1 <= stars) {
          if (stars == 1) {
            color = AppColor.redColor4;
          } else if (stars == 2) {
            color = AppColor.darkBlueColor;
          } else {
            color = AppColor.resetText;
          }
        } else {
          color = AppColor.greyColor;
        }
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: SvgPicture.asset(
            AppSvgImages.star,
            color: color,
            width: 18.0,
            height: 18.0,
          ),
        );
      }),
    );
  }
}
