import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:rive/rive.dart';
import '../../../../core/assets_images.dart';
import '../../../../core/assets_svg_images.dart';
import '../beads/sum/pages/mathematical_transactions_screen.dart';
import '../manager/current_game_cubit.dart';
import '../manager/current_game_state.dart';
import '../widget/current_game.dart';

class MyHomePageBook1 extends StatefulWidget {
  final String lessonId;

  const MyHomePageBook1({Key? key, required this.lessonId}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageBook1();
  }
}

class _MyHomePageBook1 extends State<MyHomePageBook1>
    with TickerProviderStateMixin {
  final GlobalKey _specificWidgetKey = GlobalKey();
  final GlobalKey _specificWidgetKey2 = GlobalKey();
  Offset position = const Offset(1.0, 0.4);
  @override
  void initState() {
    super.initState();
    context.read<CurrentGameCubit>().rocketAnimationController =
        AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4), // Adjust the duration as needed
    );
    context.read<CurrentGameCubit>().rocketAnimationOffsetAnimation =
        Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: const Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: context.read<CurrentGameCubit>().rocketAnimationController,
      curve: Curves.easeInOut,
    ));

    context.read<CurrentGameCubit>().candyAnimationController =
        AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Adjust the duration as needed
    );
    context.read<CurrentGameCubit>().candyAnimationOffsetAnimation =
        Tween<Offset>(
      begin: const Offset(1.0, -0.4),
      end: position,
    ).animate(CurvedAnimation(
      parent: context.read<CurrentGameCubit>().candyAnimationController,
      curve: Curves.easeInOut,
    ));

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final candyAnimationController =
        context.watch<CurrentGameCubit>().state.candyAnimationController;

    final stateOfCurrentGameCubit = context.watch<CurrentGameCubit>().state;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.bgOfMath), fit: BoxFit.fill)),
            child: Column(
              children: [
                Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 100,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 10, left: 35, right: 35),
                              // width: MediaQuery.of(context).size.width/2,
                              height: 54,
                              padding: const EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                                shadows: const [
                                  BoxShadow(
                                    color: Colors.black38,
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    stateOfCurrentGameCubit.title ?? '',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                                bottom: -5,
                                left: 0,
                                child:
                                    SvgPicture.asset(AppSvgImages.iconBlimp)),
                            Positioned(
                              bottom: -5,
                              right: 0,
                              child: SvgPicture.asset(AppSvgImages.iconBlimp),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 20,
                      right: 0,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              context.read<CurrentGameCubit>().sayInstruction(
                                  message:
                                      stateOfCurrentGameCubit.message ?? '');
                            },
                            child: Image.asset(
                              AppImages.iconGetInstruction,
                              height: 70,
                            ),
                          ),
                          30.pw
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: CurrentGame(
                  lessonId: widget.lessonId,
                )),
              ],
            ),
          ),
          if (candyAnimationController == AnimationStatus.forward) ...{
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SlideTransition(
                position: context
                    .read<CurrentGameCubit>()
                    .candyAnimationOffsetAnimation,
                child: SvgPicture.asset(
                  AppSvgImages.iconCandy,
                  // key: _specificWidgetKey2,

                  // fit: BoxFit.fill,
                  // width: 100, // Adjust the size of the image as needed
                  // height: 100,
                ),
              ),
            ),
          },
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SlideTransition(
              position: context
                  .read<CurrentGameCubit>()
                  .rocketAnimationOffsetAnimation,
              child: Image.asset(
                AppImages.imageRocket,
                key: _specificWidgetKey2,

                // fit: BoxFit.fill,
                // width: 100, // Adjust the size of the image as needed
                height: 100,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Row(
              children: [
                // 10.pw,
                BlocBuilder<CurrentGameCubit, CurrentGameInitial>(
                    builder: (context, state) => state.giftBoxArtboard != null
                        ? Rive(
                            artboard: state.giftBoxArtboard!,
                            // fit: BoxFit.fill,
                            useArtboardSize: true)
                        : GestureDetector(
                            key: _specificWidgetKey,
                            onTap: () {
                              context
                                  .read<CurrentGameCubit>()
                                  .getTheBackGround();
                            },
                            child: Row(
                              children: [
                                16.pw,
                                Column(
                                  children: [
                                    SvgPicture.asset(AppSvgImages.iconGiftBox),
                                    8.ph
                                  ],
                                ),
                              ],
                            ))) //:SizedBox()

                // SvgPicture.asset(AppImages.iconGiftBox),
              ],
            ),
          )
        ],
      ),
    );
  }
}
