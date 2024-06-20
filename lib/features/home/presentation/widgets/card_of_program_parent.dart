import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_svg_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import '../../../../core/utils.dart';
import '../../../choose_assignment_reports/presentation/pages/choose_assignment_reports_screen.dart';
import '../../../choose_assignment_reports/presentation/manager/index_of_switch_cubit.dart';
import '../../../student_assignment/presentation/manager/check_assignment_cubit/check_assignment_cubit.dart';
import '../../../student_assignment/presentation/pages/get_assignment.dart';
import '../../../unit/presentation/manager/bloc/get_unit_bloc.dart';
import '../../../unit/presentation/manager/cubit/animation_unit_cubit.dart';
import '../../../unit/presentation/pages/unit_screen.dart';
import 'package:games_models/games_models.dart';
import '../bloc/get_programs_home_bloc.dart';
import '../../../../core/injection/injection_container.dart' as di;

class CardOfProgramParent extends StatelessWidget {
  final UserCourseModel dataOfProgram;

  const CardOfProgramParent({Key? key, required this.dataOfProgram})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils.navigateTo(
            BlocProvider(
                create: (_) => IndexOfSwitchCubit(),
                child: ChooseAssignmentReportsScreen(
                  programName: dataOfProgram.program?.course?.name ?? '',
                  programId: int.parse("${dataOfProgram.program?.id ?? ''}"),
                )),
            context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - (16 * 2),
        // height: 170,
        decoration: ShapeDecoration(
            color: AppColor.lightGreyColor2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: [
              BoxShadow(
                color: AppColor.greyColor.withOpacity(.5),
                spreadRadius: 0,
                blurRadius: 5,
                offset: const Offset(0, 5),
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dataOfProgram.program?.course?.name ?? '',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: 0.50,
                    )),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              child: CachedNetworkImage(
                  imageUrl:
                      dataOfProgram.program?.image ?? DefaultHomeData.image,
                  height: MediaQuery.of(context).size.height / 8,
                  errorWidget: (context, url, error) {
                    return Image.network(
                      DefaultHomeData.image,
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 8,
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(AppSvgImages.iconAssign),
                    2.5.pw,
                    Text(
                      'Assign',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
                    ),
                    // 5.pw,
                    if ((dataOfProgram.program?.studentTests?.length ?? 0) > 0) ...{
                      2.pw,
                      Container(
                        width: 20,
                        height: 20,
                        decoration: ShapeDecoration(
                          color: AppColor.darkBlueColor10,
                          shape: OvalBorder(),
                        ),
                        alignment: Alignment.center,
                        // padding: E/dgeInsets.all(5),
                        child: Text(
                          "${dataOfProgram.program?.studentTests?.length ?? 0}",
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                  fontSize: 8.sp, fontWeight: FontWeight.w400),
                        ),
                      )
                    }
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset(AppSvgImages.iconReport),
                    5.pw,
                    Text(
                      'Report',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
                    ),
                  ],
                )
              ],
            ),
            10.ph
          ],
        ),
      ),
    );
  }
}
