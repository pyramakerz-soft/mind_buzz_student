
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:rive/rive.dart';
import '../../../../core/assets_images.dart';
import '../../../../core/assets_images_main_of_game.dart';
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
  Offset position = const Offset(1.0, 0.4);
  @override
  void initState() {
    super.initState();
    context.read<CurrentGameCubit>().getTheBackGround();
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
                        height: 90,
                        child: Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.bottomCenter,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  top: 0, left: 35, right: 35),
                              // width: MediaQuery.of(context).size.width/2,
                              height: 54,
                              padding: const EdgeInsets.all(10),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)),
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
                                bottom: -10,
                                left: -25,
                                child: SizedBox(
                                  height: 80,
                                  width: 70,
                                  child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Image.asset(AppImagesMainOfGame
                                              .imageTitleBox1, height: 40,width: 40,)),
                                      Positioned(
                                          bottom: 0,
                                          right: 0,
                                          child: Image.asset(AppImagesMainOfGame
                                              .imageTitleBox3, height: 40,width: 40,)),

                                      Positioned(
                                          left: 0,
                                          child: Image.asset(AppImagesMainOfGame
                                              .imageTitleBox2, height: 40,width: 40,)),
                                    ],
                                  ),
                                )),
                            Positioned(
                              bottom: -10,
                              right: -25,
                              child:SizedBox(
                                height: 80,
                                width: 70,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Image.asset(AppImagesMainOfGame
                                            .imageTitleBox4, height: 40,width: 40,)),
                                    Positioned(
                                        bottom: 0,
                                        left: 0,
                                        child: Image.asset(AppImagesMainOfGame
                                            .imageTitleBox5, height: 40,width: 40,)),

                                    Positioned(
                                        right: 0,
                                        child: Image.asset(AppImagesMainOfGame
                                            .imageTitleBox6, height: 40,width: 40,)),
                                  ],
                                ),
                              )
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
          Positioned(
            bottom: 10,
            child: SizedBox(
              width: 100,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: 20,
                    margin:const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.white,
                    ),
                    height:
                    MediaQuery.of(context).size.height-70,
                  ),
                  Container(
                    width: 20,
                    margin:const EdgeInsets.only(bottom: 20),

                    decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(6),
                        image: const DecorationImage(
                            image: AssetImage(
                                AppImagesMainOfGame.imageCompleteBar),
                            fit: BoxFit.cover)),
                    height:0,
                  ),
                  BlocBuilder<CurrentGameCubit, CurrentGameInitial>(
                            builder: (context, state) =>
                            state.beeWinningArtboard != null
                                ? SizedBox(
                                  width: 100,
                                  child: Rive(
                                      artboard: state.beeWinningArtboard!,
                                      useArtboardSize: true),
                                )
                                : const SizedBox()) //:SizedBox()

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
