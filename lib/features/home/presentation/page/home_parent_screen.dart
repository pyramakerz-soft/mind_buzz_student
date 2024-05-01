import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/extensions.dart';
import 'package:mind_buzz_refactor/core/theme_text.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../../../../core/talk_tts.dart';
import '../../../../core/utils.dart';
import '../../../../core/widgets/switch_bar.dart';
import '../../../login/presentation/cubit/login_cubit.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../../student_assignment/presentation/manager/check_assignment_cubit.dart';
import '../../../student_assignment/presentation/pages/student_assignment.dart';
import '../bloc/get_programs_home_bloc.dart';
import '../widgets/card_of_program.dart';
import '../widgets/card_of_program_parent.dart';

class HomeParentScreen extends StatefulWidget {
  const HomeParentScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeParentScreen();
  }
}

class _HomeParentScreen extends State<HomeParentScreen> {
  @override
  Widget build(BuildContext context) {
    final userData = context.read<LoginCubit>().userData;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: switchBar(isStudent: false, context: context),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            10.ph,
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
                                  fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text(userData?.school?.name ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                      ],
                    )
                  ],
                ),
              ],
            ),
            20.ph,
            Expanded(
                child: BlocProvider<GetProgramsHomeBloc>(
                    create: (_) =>
                        di.sl<GetProgramsHomeBloc>()..add(GetProgramsRequest()),
                    child:
                        BlocConsumer<GetProgramsHomeBloc, GetProgramsHomeState>(
                            listener: (context, state) {
                      if (state is GetProgramsErrorInitial) {
                        if (state.message == RELOGIN_FAILURE_MESSAGE) {
                          Utils.navigateAndRemoveUntilTo(
                              LoginScreen(), context);
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
                        return const Center(
                            child: CupertinoActivityIndicator());
                      } else if (state is GetProgramsCompleteInitial) {
                        return Wrap(
                          spacing: 16,
                          runSpacing: 20,
                          children: List.generate(
                            state.data.length,
                            (index) => CardOfProgramParent(
                              programId: "${state.data[index].programId ?? ''}",
                              colors: DefaultHomeData.fullDataOfCardColor.first,
                              mainImage: state.data[index].program?.image,
                              title:state.data[index].program?.course?.name ?? '',
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox();
                      }
                    })))
          ],
        ),
      ),
    );
  }
}
