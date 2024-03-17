import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/app_color.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:provider/provider.dart';

import '../../../../core/injection/injection_container.dart';
import '../../../../core/utils.dart';
import '../../../login/presentation/bloc/login_data_bloc.dart';
import '../../../login/presentation/cubit/login_cubit.dart';
import '../bloc/get_programs_home_bloc.dart';
import '../widgets/card_of_program.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = context.read<LoginCubit>().userData;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
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
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black),
                  child: SvgPicture.asset(
                    AppImages.iconLogout,
                    width: 15,
                  ),
                )
              ],
            ),
            25.ph,
            Expanded(
                child:Provider<GetProgramsHomeBloc>(
                    create: (_) => GetProgramsHomeBloc(programUserUseCases: sl()),child: BlocConsumer<GetProgramsHomeBloc, GetProgramsHomeState>(
                    listener: (context, state) {
              if (state is GetProgramsErrorInitial) {
                final snackBar = SnackBar(
                  content: Text(state.message),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            }, builder: (context, state) {
                      if(state is GetProgramsLoadingInitial){
                        return const CircularProgressIndicator();
                      }else if (state is GetProgramsCompleteInitial) {
                        return Column(
                          children: [
                            CardOfProgram(
                              colors: [
                                AppColor.yellowColor1,
                                AppColor.yellowColor2,
                                AppColor.yellowColor3
                              ],
                              mainImage: AppImages.imagePhonics,
                              title: 'Phonics',
                            )
                          ],
                        );
                      }else{
                        return SizedBox();
                      }
            })))
          ],
        ),
      ),
    );
  }
}
