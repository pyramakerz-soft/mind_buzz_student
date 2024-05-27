import 'dart:developer';

import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/assets_images.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/phonetics/presentation/games/click_the_sound/widgets/stroked_text_widget.dart';
import '../../../../core/assets_animation.dart';
import '../../../../core/assets_svg_images.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/app_color.dart';
import '../../../../core/theme_text.dart';
import '../../../../core/utils.dart';
import '../../../home/presentation/bloc/get_programs_home_bloc.dart';
import '../../../home/presentation/page/based_home_screen.dart';
import '../../../home/presentation/page/home_parent_screen.dart';
import '../../../home/presentation/page/home_screen.dart';
import '../../../loading_intro/presentation/bloc/loading_cubit.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../../../../core/widgets/button_start_game.dart';
import '../manager/who_am_i_cubit.dart';
import '../widgets/item_in_choose.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WhoAmIScreen extends StatelessWidget {
  const WhoAmIScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<WhoAmICubit>().state;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Stack(
              fit: StackFit.passthrough,
              children: [
                BlocProvider<GetProgramsHomeBloc>(
                    create: (_) => di.sl<GetProgramsHomeBloc>(),
                    child: Container(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 70,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SvgPicture.asset(
                                  AppSvgImages.bgChooseWhoAmI,
                                  color: AppColor.skyBlueColor,
                                  width: MediaQuery.of(context).size.width - 70,
                                ),
                                 Positioned(
                    bottom: -20,
                    left: -50,
                    child: Transform.rotate(
                      angle: 0.25,
                      child: SizedBox(
                        height: 150,
                        width: 150,
                        child: RiveAnimation.asset(
                          AppAnimation.beeRive,
                        ),
                      ),
                    )
                    // Image.asset(
                    //   AppImages.halfBee,
                    //   height: 150,
                    // ),
                    ),
                                const Positioned(
                                  top: -30,
                                  left: 0,
                                  child: SizedBox(
                                    height: 120,
                                    width: 120,
                                    child: RiveAnimation.asset(
                                      AppAnimation.cloudRive,
                                    ),
                                  ),
                                ),
                                     const Positioned(
                                  top: 0,
                                  right: 0,
                                  child: SizedBox(
                                    height: 170,
                                    width: 170,
                                    child: RiveAnimation.asset(
                                      AppAnimation.cloudRive,
                                    ),
                                  ),
                                ),
                                  Positioned(
                                  top: 50,
                                  left: 25,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            di.sl<GetProgramsHomeBloc>()..add(LogOutRequest());
                                            context.read<WhoAmICubit>().clearIndex();
                                            Utils.navigateAndRemoveUntilTo(BlocProvider(create: (_) => LoadingCubit(), child: LoginScreen()), context);
                                          },
                                          child: Container(
                                              padding: const EdgeInsets.all(9),
                                              alignment: Alignment.center,
                                              height: 42,
                                              width: 42,
                                              decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: AppColor.darkBlueColor),
                                              child: SvgPicture.asset(
                                                AppSvgImages.iconLogout,
                                                fit: BoxFit.fill,
                                              ))),
                                      20.pw,
                         
                                      Text(
                                        'Sign In',
                                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                              color: AppColor.darkBlueColor,
                                              fontSize: 40,
                                              fontWeight: FontWeight.w700,
                                              fontFamily: AppTheme.getFontFamily5(),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                                 
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                // Positioned(
                //     bottom: -20,
                //     left: -50,
                //     child: Transform.rotate(
                //       angle: 0.25,
                //       child: SizedBox(
                //         height: 150,
                //         width: 150,
                //         child: RiveAnimation.asset(
                //           AppAnimation.beeRive,
                //         ),
                //       ),
                //     )
                //     // Image.asset(
                //     //   AppImages.halfBee,
                //     //   height: 150,
                //     // ),
                //     )
              ],
            ),
            20.ph,
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const ItemInChoose(
                    text: 'Parent',
                    image: AppImages.imageParent,
                    id: 0,
                  ),
                  24.ph,
                  const ItemInChoose(
                    text: 'Student',
                    image: AppImages.imageChild,
                    id: 1,
                  ),
                ],
              ),
            ),
            const Spacer(),
            ButtonLogin(
              playButton: (currentIndex != null),
              dataFunction: () {
                if (currentIndex != null) {
                  log('currentIndex:$currentIndex');
                  Utils.navigateAndRemoveUntilTo(const BasedHomeScreen(), context);
                } else {
                  const snackBar = SnackBar(
                    content: Text('select who you are'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              title: "Next",
              width: MediaQuery.of(context).size.width - (48),
            ),
            20.ph,
          ],
        ));
  }
}
