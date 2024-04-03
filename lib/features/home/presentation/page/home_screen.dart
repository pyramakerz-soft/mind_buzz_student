import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:provider/provider.dart';

import '../../../../core/injection/injection_container.dart' as di;
import '../../../../core/talk_tts.dart';
import '../../../login/presentation/cubit/login_cubit.dart';
import '../bloc/get_programs_home_bloc.dart';
import '../widgets/card_of_program.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = context.read<LoginCubit>().userData;
    TalkTts.startTalk(text: 'You have assignment');
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
                          AppImages.iconLogout,
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
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'You have assignment',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                        final snackBar = SnackBar(
                          content: Text(state.message),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      if (state is LogOutLoadingState) {
                        Navigator.of(context).pop();
                      }
                    }, builder: (context, state) {
                      if (state is GetProgramsLoadingInitial) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is GetProgramsCompleteInitial) {
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
