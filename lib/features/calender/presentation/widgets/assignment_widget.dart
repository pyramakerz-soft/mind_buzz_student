import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/parent_assets.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/app_color.dart';
import '../../../../core/enums/assignment_status.dart';
import '../../../../core/theme_text.dart';
import '../../../home/domain/entities/test_model.dart';


class AssignmentWidget extends StatelessWidget {
  final TestModel singleTest;
  const AssignmentWidget(
      {Key? key, required this.singleTest})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 7.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border(
            left: BorderSide(width: 6, color: singleTest.getColorOfTest()),
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
            SizedBox(
              width: MediaQuery.of(context).size.width - 70,
              child: Text(
                singleTest.programName ?? '',
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

            Padding(
              padding:  EdgeInsets.symmetric(vertical: 7.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      singleTest.programName ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(
                              fontSize: 0.02.sh,
                              fontWeight: FontWeight.bold,
                              height: 0,
                              letterSpacing: 0.44,
                              overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AssignmentStatus.values.firstWhere((element) => element.text() == singleTest.status).color().withOpacity(0.2),
                    ),
                    child: Text(singleTest.status??'',
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge
                          ?.copyWith(
                          fontSize: 0.015.sh,
                          fontWeight: FontWeight.bold,
                          color: AssignmentStatus.values.firstWhere((element) => element.text() == singleTest.status).color(),
                          height: 0,
                          letterSpacing: 0.44,
                          overflow: TextOverflow.ellipsis),),
                  )

                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Lesson ${singleTest.lessonNum}',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400,color: AppColor.lightGreyColor3),
                ),
                Spacer(),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(ParentImages.timers, height: 13,),
                    5.pw,
                    Text('Deadline  ',
                      style: TextStyle(
                          color: AppColor.lightGreyColor3,
                          fontSize: 12, fontFamily: AppTheme.getFontFamily3(), fontWeight: FontWeight.w700
                      ),),
                    Text(
                      "${singleTest.formattedDueDate}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColor.lightGreyColor3.withOpacity(0.7),
                          fontSize: 12, fontFamily: AppTheme.getFontFamily3(), fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                )
              ],
            ),


          ],
        ),
      ),
    );
  }
}
