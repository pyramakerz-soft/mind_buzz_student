import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/app_color.dart';
import '../../../../core/assets_svg_images.dart';

import '../../../../core/assets_images.dart';
import '../../../../core/utils.dart';
import '../../../../core/widgets/card_of_my_info.dart';
import '../../../home/domain/entities/user_courses.dart';
import '../../../home/presentation/bloc/get_programs_home_bloc.dart';
import '../../../login/presentation/cubit/login_cubit.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../manager/check_assignment_cubit/check_assignment_cubit.dart';
import '../widgets/card_of_assignment.dart';

class StudentAssignmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final assignmentProgrammes =
        context.watch<CheckAssignmentCubit>().state.assignmentProgrammes;

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(
                kToolbarHeight), // Adjust the height to accommodate the shadow            child: Container(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 9,
                    offset: Offset(0, 1), // Shadow position, adjust as needed
                  ),
                ],
              ),
              child: AppBar(
                leading: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.42),
                          color: AppColor.whiteRed),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                centerTitle: false,
                backgroundColor: Colors.white,
                title: Text(
                  'Programs',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        // height: 0,
                        // letterSpacing: 0.44,
                        fontSize: 22,
                      ),
                ),
              ),
            )),
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                10.ph,
                ...List.generate(
                  assignmentProgrammes
                          ?.where((element) =>
                              element.program?.tests?.isNotEmpty == true)
                          .length ??
                      0,
                  (index) => CardOfAssignment(
                    assignmentTask:
                        assignmentProgrammes?[index] ?? UserCourseModel(),
                  ),
                )
              ],
            )));
  }
}
