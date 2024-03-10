import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/app_color.dart';
import '../../../../core/assets_animation.dart';
import '../../../../core/assets_images.dart';
import '../../../../core/utils.dart';
import '../../../../core/widgets/main_hive_riv.dart';
import '../../../intro_screen/presentation/bloc/intro_cubit.dart';
import '../../../intro_screen/presentation/page/intro_screen.dart';
import '../bloc/choose_avatar_cubit.dart';
import '../widget/lock_avatar.dart';

class ChooseAvatarScreen extends StatelessWidget {
  const ChooseAvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (x) {
        Utils.navigateAndRemoveUntilTo(
            BlocProvider(
                create: (_) => IntroCubit(), child: const IntroScreen()),
            context);
      },
      child: Scaffold(
        backgroundColor: AppColor.lightBlueColor2,
        body: Stack(
          children: [
            Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                    onPressed: () {
                      Utils.navigateAndRemoveUntilTo(
                          BlocProvider(
                              create: (_) => IntroCubit(),
                              child: const IntroScreen()),
                          context);
                    },
                    icon: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          color: Colors.white),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 15,
                      ),
                    ))),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                65.ph,
                SvgPicture.asset(
                  AppImages.iconChooseYourCharacter,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const Spacer(),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Stack(
                        alignment: Alignment.center,
                        children: [
                          BlocBuilder<ChooseAvatarCubit, ChooseAvatarInitial>(
                            builder: (context, state) => GestureDetector(
                                onTap: () {
                                  if (context
                                          .read<ChooseAvatarCubit>()
                                          .state
                                          .selectedAvatar ==
                                      null) {
                                    context
                                        .read<ChooseAvatarCubit>()
                                        .submitSelectedAvatar(
                                            newSelectedAvatar:
                                                AppImages.imageAvatar2,
                                            context: context);
                                  }
                                },
                                child: SizedBox(
                                  height: double.infinity,
                                  child: state.selectedAvatar ==
                                          AppImages.imageAvatar2
                                      ? GameWidget(game: RiveGame(rive: AppAnimation.avatarDogRiv))
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              top: 25.0, left: 10),
                                          child: Image.asset(
                                            AppImages.iconDog,
                                          )),
                                )),
                          )
                        ],
                      )),
                      const LockAvatar(avatar: AppImages.imageAvatar1),
                      const LockAvatar(avatar: AppImages.imageAvatar3),
                      const LockAvatar(avatar: AppImages.imageAvatar4),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
