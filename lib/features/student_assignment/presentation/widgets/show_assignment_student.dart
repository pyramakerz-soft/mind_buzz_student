import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/app_color.dart';
import '../../../../core/utils.dart';
import '../../../display_assignment/presentation/manager/bloc/assignment_bloc.dart';
import '../../../display_assignment/presentation/manager/cubit/total_assignment_cubit.dart';
import '../../../display_assignment/presentation/pages/display_assignment.dart';
import '../../../home/domain/entities/test_model.dart';
import '../../../home/domain/entities/user_courses.dart';
import '../pages/student_assignment.dart';

class ShowAssignmentStudent extends StatefulWidget {
  final UserCourseModel courseData;

  const ShowAssignmentStudent({Key? key, required this.courseData})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShowAssignmentStudent();
  }
}
class _ShowAssignmentStudent extends State<ShowAssignmentStudent>{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            clipBehavior: Clip.antiAlias,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: AppColor.blackRed,
                  blurRadius: 13,
                  offset: Offset(0, 9),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.courseData.program?.course?.name ?? '',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        height: 0.06,
                      ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 25,
                    height: 25,
                    clipBehavior: Clip.antiAlias,
                    decoration: ShapeDecoration(
                      color: AppColor.whiteRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.42),
                      ),
                    ),
                    child: const Icon(
                      Icons.close,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          ),
          10.ph,
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    widget.courseData.program?.studentTests?.length ?? 0,
                    (index) => Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                border: Border(
                                  left: BorderSide(
                                      width: 6, color: Color(0xFFCCCCCC)),
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
                              child: InkWell(
                                onTap: () {
                                  Utils.navigateTo(
                                      BlocProvider(
                                          create: (_) => di.sl<AssignmentBloc>()
                                            ..add(GetAssignmentDataEvent(
                                                programId:
                                                widget.courseData.programId ?? 0,
                                                testId: widget.courseData
                                                        .program
                                                        ?.studentTests?[index]
                                                        .id ??
                                                    0)),
                                          child: DisplayAssignment(testId: widget.courseData
                                              .program
                                              ?.studentTests?[index]
                                              .testId ??
                                              0,
                                            action: () {
                                              UserCourseModel x=  widget.courseData;
                                            List<TestModel>y = widget.courseData.program?.studentTests??[];
                                            y.removeWhere((element)=> element.testId ==widget.courseData.program?.studentTests?[index].testId );
                                              // x.program.studentTests =
                                            },)),
                                      context);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.courseData.program?.studentTests?[index].assignmentName??'Assignment',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayLarge
                                                  ?.copyWith(
                                                    fontSize: 22,
                                                    fontWeight: FontWeight.w700,
                                                    height: 0,
                                                    letterSpacing: 0.44,
                                                  ),
                                            ),
                                            Text(
                                              widget.courseData
                                                      .program
                                                      ?.studentTests?[index]
                                                      .name ??
                                                  '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium
                                                  ?.copyWith(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    // height: 0,
                                                    // letterSpacing: 0.44,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        const Icon(
                                          Icons.play_circle_outline_rounded,
                                          color: AppColor.darkBlueColor,
                                          size: 35,
                                        )
                                      ],
                                    ),
                                    ClipRRect(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                        widget.courseData.program?.image ?? '',
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            10.ph
                          ],
                        )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
