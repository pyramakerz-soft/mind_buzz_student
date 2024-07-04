import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/extensions.dart';
import 'package:mind_buzz_refactor/core/singleton.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/core/widgets/custom_pop_up.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../../../../core/talk_tts.dart';
import '../../../../core/utils.dart';
import '../../../../core/widgets/card_of_my_info.dart';
import '../../../login/presentation/cubit/login_cubit.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../../student_assignment/presentation/manager/check_assignment_cubit/check_assignment_cubit.dart';
import '../../../student_assignment/presentation/pages/student_assignment.dart';
import '../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../bloc/get_programs_home_bloc.dart';
import '../widgets/card_of_program.dart';
import '../widgets/switch_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        20.ph,
        const CardOfMyInfo(),
        20.ph,
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: BlocProvider<GetProgramsHomeBloc>(
              create: (_) =>
                  di.sl<GetProgramsHomeBloc>()..add(GetProgramsRequest()),
              child: BlocConsumer<GetProgramsHomeBloc, GetProgramsHomeState>(
                  listener: (context, state) {
                if (state is GetProgramsCompleteInitial &&
                    context.read<WhoAmICubit>().state.isFirst &&
                    Singleton().studentAssignments != null &&
                    state.isHaveAssignments) {
                  _buildCustomPopUp(context, state);
                }
                if (state is GetProgramsErrorInitial) {
                  if (state.message == RELOGIN_FAILURE_MESSAGE) {
                    Utils.navigateAndRemoveUntilTo(LoginScreen(), context);
                  } else {
                    final snackBar = SnackBar(
                      content: Text(state.message),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                } else if (state is LogOutLoadingState) {
                  Navigator.of(context).pop();
                } else if (state is GetProgramsCompleteInitial) {
                  if (state.isHaveAssignments) {
                    TalkTts.startTalk(text: DefaultHomeData.haveAnAssignment);
                  }
                }
              }, builder: (context, state) {
                if (state is GetProgramsLoadingInitial) {
                  return const Center(child: CupertinoActivityIndicator());
                } else if (state is GetProgramsCompleteInitial) {
                  return SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        if (Singleton().studentAssignments != null &&
                            state.isHaveAssignments) ...{
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: AppColor.redColor),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 12),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 4,
                                    child: FittedBox(
                                      child: Text(
                                        DefaultHomeData.haveAnAssignment,
                                        style: TextStyle(
                                            fontSize: MediaQuery.of(context)
                                                        .size
                                                        .reDeginSize(
                                                            16, context) >
                                                    16
                                                ? 16
                                                : MediaQuery.of(context)
                                                    .size
                                                    .reDeginSize(16, context),
                                            fontWeight: FontWeight.w600,
                                            color: AppColor.white),
                                      ),
                                    ),
                                  ),
                                  10.pw,
                                  Flexible(
                                    flex: 2,
                                    child: Stack(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Utils.navigateTo(
                                                BlocProvider(
                                                    create: (_) =>
                                                        CheckAssignmentCubit(
                                                            assignmentProgrammes:
                                                                state.data),
                                                    child:
                                                        StudentAssignmentScreen()),
                                                context);
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                color: Colors.white),
                                            child: Text(
                                              'Start Now?',
                                              //style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColor.redColor4, fontSize: MediaQuery.of(context).size.reDeginSize(13, context) > 35 ? 35 : MediaQuery.of(context).size.reDeginSize(13, context), fontWeight: FontWeight.w700),
                                              style: TextStyle(
                                                  color: AppColor.redColor4,
                                                  fontSize: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .reDeginSize(
                                                                  13, context) >
                                                          14
                                                      ? 14
                                                      : MediaQuery.of(context)
                                                          .size
                                                          .reDeginSize(
                                                              13, context),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          top: -3,
                                          child: Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColor.redColor,
                                                  width: 1),
                                            ),
                                            constraints: const BoxConstraints(
                                              minWidth: 20,
                                              minHeight: 20,
                                            ),
                                            child: Center(
                                              child: Text(
                                                "${state.data.fold(0, (previousValue, element) => (element.program?.studentTests?.length ?? 0) + (int.parse('$previousValue')))}",
                                                style: const TextStyle(
                                                  color: AppColor.redColor,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        },
                        Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  (state.isHaveAssignments ? (240) : 170),
                              child: ListView.separated(
                                shrinkWrap: true,
                                itemCount: state.data.length,
                                itemBuilder: (context, index) => CardOfProgram(
                                  programId:
                                      "${state.data[index].programId ?? ''}",
                                  colors: DefaultHomeData.getColor(
                                      index: (index + 1)),
                                  mainImage: state.data[index].program?.image,
                                  title:
                                      state.data[index].program?.course?.name ??
                                          '',
                                ),
                                separatorBuilder: (context, index) =>
                                    index == state.data.length - 1
                                        ? 50.ph
                                        : 12.ph,
                              ),
                            ),
                            40.ph,
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              })),
        ))
      ],
    );
  }

  _buildCustomPopUp(BuildContext context, GetProgramsCompleteInitial state) {
    final whoAmICubit = context.read<WhoAmICubit>();
    whoAmICubit.openFirstTime();
    return showCustomDialog(
        context: context,
        firstContent: 'you have ',
        numberOfAssignments:
            "${state.data.fold(0, (previousValue, element) => (element.program?.studentTests?.length ?? 0) + (int.parse('$previousValue')))}",
        remainingContent: ' Assignments',
        buttonTitle: 'Start Now',
        onButtonPressed: () {
          Navigator.of(context).pop();
          Utils.navigateTo(
              BlocProvider(
                  create: (_) =>
                      CheckAssignmentCubit(assignmentProgrammes: state.data),
                  child: StudentAssignmentScreen()),
              context);
        });
  }
}
