import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:rive/rive.dart';

import '../../../../core/app_color.dart';
import '../../../../core/assets_images.dart';
import '../bloc/intro_cubit.dart';
import '../bloc/intro_state.dart';
import '../widget/button_start_game.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _IntroScreen();
  }
}

class _IntroScreen extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    BlocProvider.of<IntroCubit>(context).startRiveAnimation();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    BlocProvider.of<IntroCubit>(context).saveAnimationController(
        controller: _controller, animation: _animation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: AppColor.lightBlueColor2,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: BlocBuilder<IntroCubit, IntroState>(
                        builder: (context, state) =>
                            state.riveArtboardBees != null
                                ? Rive(
                                    artboard: state.riveArtboardBees!,
                                    fit: BoxFit.fitWidth,
                                  )
                                : const SizedBox()),
                  ),
                  Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          25.ph,
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SvgPicture.asset(AppImages.iconWelcomeTo),
                                Image.asset(AppImages.mindBuzzImage),
                                10.ph
                              ],
                            ),
                          ),
                          // 20.ph,
                          const Expanded(
                            flex: 2,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: SizedBox(),
                                ),
                                Expanded(child: ButtonStartGame())
                              ],
                            ),
                          ),
                          20.ph
                        ],
                      ))
                ],
              ),
              Positioned(
                bottom: 0,
                height: 150,
                width: 300,
                child: BlocBuilder<IntroCubit, IntroState>(
                    builder: (context, state) {
                  return AnimatedBuilder(
                      animation: state.animation!,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, 200 * (1 - state.animation!.value)),
                          child: Opacity(
                              opacity: state.animation!.value,
                              child: state.riveArtboardBeeCharacter != null
                                  ? GestureDetector(
                                      onTap: () async {
                                        await context
                                            .read<IntroCubit>()
                                            .beeTalk();
                                      },
                                      child: Rive(
                                        alignment: Alignment.center,
                                        useArtboardSize: true,
                                        artboard:
                                            state.riveArtboardBeeCharacter!,
                                        fit: BoxFit.fitWidth,
                                        clipRect: Rect.fromCenter(
                                            center: Offset(0, 0),
                                            width: 450,
                                            height: 450),
                                        // enablePointerEvents: true                                          // .none,
                                      ),
                                    )
                                  : const SizedBox()),
                        );
                      });
                }),
              )
            ],
          ),
        ));
  }
}
