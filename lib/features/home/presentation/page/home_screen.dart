import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../../../../core/talk_tts.dart';
import '../../../../core/utils.dart';
import '../../../login/presentation/cubit/login_cubit.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../bloc/get_programs_home_bloc.dart';
import '../widgets/card_of_program.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}
class _HomeScreen extends State<HomeScreen>{
  @override
  void initState() {
    TalkTts.startTalk(text: DefaultHomeData.haveAnAssignment);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final userData = context.read<LoginCubit>().userData;
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
                                  fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        Text('How are you?',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w400)),
                      ],
                    )
                  ],
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
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
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.redColor),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DefaultHomeData.haveAnAssignment,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white),
                    child: Text(
                      'Start Now?',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
            25.ph,
            Expanded(
                child: BlocProvider<GetProgramsHomeBloc>(
                    create: (_) =>
                        di.sl<GetProgramsHomeBloc>()..add(GetProgramsRequest()),
                    child:
                        BlocConsumer<GetProgramsHomeBloc, GetProgramsHomeState>(
                            listener: (context, state) {
                      if (state is GetProgramsErrorInitial) {
                        if(state.message == RELOGIN_FAILURE_MESSAGE){
                          Utils.navigateAndRemoveUntilTo(LoginScreen(), context);

                        }else {
                          final snackBar = SnackBar(
                            content: Text(state.message),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      }else if (state is LogOutLoadingState) {
                        Navigator.of(context).pop();
                      }
                    }, builder: (context, state) {
                      if (state is GetProgramsLoadingInitial) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      else if (state is GetProgramsCompleteInitial) {
                        return Column(
                          children: List.generate(
                              state.data.length,
                              (index) => Column(
                                    children: [
                                      CardOfProgram(
                                        programId:
                                            "${state.data[index].programId ?? ''}",
                                        colors: DefaultHomeData
                                            .fullDataOfCardColor.first,
                                        mainImage:
                                            state.data[index].program?.image,
                                        title: state.data[index].program?.course
                                                ?.name ??
                                            '',
                                      )
                                    ],
                                  )),
                        );
                      }
                      else {
                        return const SizedBox();
                      }
                    })))
          ],
        ),
      ),
    );
  }
}
