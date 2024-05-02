import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/app_color.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/assets_images.dart';
import '../../../../core/utils.dart';
import '../../../home/domain/entities/user_courses.dart';
import '../../../home/presentation/bloc/get_programs_home_bloc.dart';
import '../../../login/presentation/cubit/login_cubit.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../manager/check_assignment_cubit.dart';
import '../widgets/card_of_assignment.dart';

class StudentAssignmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = context.read<LoginCubit>().userData;
    final assignmentProgrammes =
        context.watch<CheckAssignmentCubit>().state.assignmentProgrammes;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                20.ph,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            AppImages.imagePersonAvatar,
                            width: 50,
                          ),
                        ),
                        10.pw,
                        Column(
                          children: [
                            Text(
                              'Hi ${userData?.name ?? ''} !',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
                            ),
                            Text('How are you?',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400)),
                          ],
                        )
                      ],
                    ),
                    GestureDetector(
                        onTap: () {
                          Utils.navigateAndRemoveUntilTo(
                              LoginScreen(), context);
                          di.sl<GetProgramsHomeBloc>().add(LogOutRequest());
                        },
                        child: Container(
                            padding: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.darkBlueColor3),
                            child: SvgPicture.asset(
                              AppSvgImages.iconLogout,
                              fit: BoxFit.fill,
                              color: Colors.white,
                            )))
                  ],
                ),
                20.ph,
                ...List.generate(
                  assignmentProgrammes?.where((element) => element.program?.tests?.isNotEmpty==true).length ?? 0,
                  (index) => CardOfAssignment(
                    assignmentTask:
                        assignmentProgrammes?[index] ?? UserCourseModel(),
                  ),
                )
              ],
            )));
  }
}
