import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/extensions.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../../../../core/talk_tts.dart';
import '../../../../core/utils.dart';
import '../../../../core/widgets/card_of_my_info.dart';
import '../../../login/presentation/cubit/login_cubit.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../../student_assignment/presentation/manager/check_assignment_cubit.dart';
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
  void initState() {
    TalkTts.startTalk(text: DefaultHomeData.haveAnAssignment);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userData = context.read<LoginCubit>().userData;
    return Column(
      children: [
        10.ph,
        const CardOfMyInfo(),
        20.ph,
        Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocProvider<GetProgramsHomeBloc>(
                  create: (_) =>
                      di.sl<GetProgramsHomeBloc>()..add(GetProgramsRequest()),
                  child: BlocConsumer<GetProgramsHomeBloc, GetProgramsHomeState>(
                      listener: (context, state) {
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
                    }
                  }, builder: (context, state) {
                    if (state is GetProgramsLoadingInitial) {
                      return const Center(child: CupertinoActivityIndicator());
                    } else if (state is GetProgramsCompleteInitial) {
                      return Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppColor.redColor),
                            padding: const EdgeInsets.symmetric(
                                vertical: 7, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  DefaultHomeData.haveAnAssignment,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .reDeginSize(16, context) >
                                                  35
                                              ? 35
                                              : MediaQuery.of(context)
                                                  .size
                                                  .reDeginSize(16, context),
                                          fontWeight: FontWeight.w700),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Utils.navigateTo(
                                        BlocProvider(
                                            create: (_) => CheckAssignmentCubit(
                                                assignmentProgrammes: state.data),
                                            child: StudentAssignmentScreen()),
                                        context);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white),
                                    child: Text(
                                      'Start Now?',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.copyWith(
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .reDeginSize(
                                                              13, context) >
                                                      35
                                                  ? 35
                                                  : MediaQuery.of(context)
                                                      .size
                                                      .reDeginSize(13, context),
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          25.ph,
                          ...List.generate(
                              state.data.length,
                              (index) => Column(
                                    children: [
                                      CardOfProgram(
                                        programId:
                                            "${state.data[index].programId ?? ''}",
                                        colors: DefaultHomeData.getColor(
                                            index: (index + 1)),
                                        mainImage:
                                            state.data[index].program?.image,
                                        title: state.data[index].program?.course
                                                ?.name ??
                                            '',
                                      ),
                                      15.ph,
                                    ],
                                  ))
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  })),
            ))
      ],
    );
  }
}
