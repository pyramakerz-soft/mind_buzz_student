import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';

import '../../../../core/vars.dart';
import '../../../home/domain/entities/user_courses.dart';
import 'show_assignment_student.dart';

class CardOfAssignment extends StatelessWidget {
  final UserCourseModel assignmentTask;

  const CardOfAssignment({Key? key, required this.assignmentTask})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showBottomSheet(
              elevation: 0,
              backgroundColor: Colors.white,
              context: context,
              builder: (BuildContext context) {
                return ShowAssignmentStudent(
                  courseData: assignmentTask,
                );
              });
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border(
              left: BorderSide(width: 6, color: Color(0xFFCCCCCC)),
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x14000000),
                blurRadius: 8,
                offset: Offset(0, 1),
                spreadRadius: 0,
              )
            ],
          ),
          // color: Colors.white,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      assignmentTask.program?.course?.name ?? '',
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: 0.44,
                          ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColor.darkBlueColor,
                              borderRadius: BorderRadius.circular(8)),
                          width: 90,
                          height: 40,
                          padding: EdgeInsets.all(8),
                          child: Text(
                            'Start',
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      height: 0.08,
                                    ),
                          )),
                    )
                  ],
                ),
                ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl: assignmentTask.program?.image ?? '',
                    height: MediaQuery.of(context).size.height / 6,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
