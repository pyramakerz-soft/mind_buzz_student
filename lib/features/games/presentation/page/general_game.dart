import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rive/rive.dart';
import '../../../../core/injection/injection_container.dart' as di;
import '../../../../core/app_color.dart';
import '../../../../core/assets_images.dart';
import '../../../../core/vars.dart';
import '../bloc/game1/game_one_bloc.dart';
import '../bloc/general_game/game_cubit.dart';
import 'game1_sound_and_add_to_box.dart';

class GeneralGame extends StatefulWidget {
  const GeneralGame({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<GeneralGame>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // context.read<GameCubit>().reStartMusic();

    context.read<GameCubit>().controllerAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    final curvedAnimation = CurvedAnimation(
      parent: context.read<GameCubit>().controllerAnimation,
      curve: Curves.easeInOut,
    );

    context.read<GameCubit>().animation =
        Tween<double>(begin: 0.0, end: 0.5).animate(curvedAnimation)
          ..addListener(() {
            setState(() {});
          });
    context.read<GameCubit>().controllerAnimation.addStatusListener((status) {
      if (status == AnimationStatus.forward) {
        context.read<GameCubit>().repeatCount++;
        if (context.read<GameCubit>().repeatCount >= 3) {
          context.read<GameCubit>().controllerAnimation.stop();
        }
      }
    });
    context.read<GameCubit>().animationControllerCelebration =
        AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Adjust the duration as needed
    );

    context.read<GameCubit>().animationCelebration = Tween<Offset>(
      begin: const Offset(0, -1.0), // Start above the screen
      end: const Offset(0, 1.0), // End below the screen
    ).animate(context.read<GameCubit>().animationControllerCelebration);
    context
        .read<GameCubit>()
        .animationControllerCelebration
        .addStatusListener((state) {
      // if (state == AnimationStatus.reverse) {
      //   context.read<StartGameProvider>().animationControllerCelebration.stop();
      // }
    });
    // _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    // final countOfFingers = context
    //     .select((GameCubit value) => value.touchPositions.length);

    return PopScope(
        onPopInvoked: (x) {
          context.read<GameCubit>().stopPlayMusic();
        },
        child: Scaffold(
            body: Transform.translate(
                offset: Offset(
                  context.read<GameCubit>().animation.value * 30.0,
                  0,
                ),
                child: Listener(
                    onPointerDown: (opm) {
                      context
                          .read<GameCubit>()
                          .savePointerPosition(opm.pointer, opm.position);
                      // savePointerPosition(opm.pointer, opm.position);
                    },
                    onPointerMove: (opm) {
                      context
                          .read<GameCubit>()
                          .savePointerPosition(opm.pointer, opm.position);
                      // savePointerPosition(opm.pointer, opm.position);
                    },
                    onPointerCancel: (opm) {
                      context
                          .read<GameCubit>()
                          .clearPointerPosition(opm.pointer);
                      // savePointerPosition(opm.pointer, opm.position);
                    },
                    onPointerUp: (opm) {
                      context
                          .read<GameCubit>()
                          .clearPointerPosition(opm.pointer);
                      // savePointerPosition(opm.pointer, opm.position);
                    },
                    child: Container(
                        // padding: const EdgeInsets.symmetric(vertical: 20),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: const BoxDecoration(
                            color: AppColor.lightBlueColor2,
                            image: DecorationImage(
                                image: AssetImage(
                                  AppImages.bgAlphaBg,
                                ),
                                fit: BoxFit.fill)),
                        child: BlocBuilder<GameCubit, GameState>(
                            builder: (context, state) => Stack(children: [
                                  state.dataQuestions[state.currentIndex] == 0
                                      ? BlocProvider(
                                          create: (context) => di
                                              .sl<GameOneBloc>()
                                            ..add(
                                                GetGameData(showOffline: true)),
                                          child: const Game1SoundAndAddToBox())
                                      : const SizedBox(),
                                  Positioned(
                                      bottom: 15,
                                      left: 25,
                                      child: SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3,
                                        child: GestureDetector(
                                          onTap: () async {
                                            // await context
                                            //     .read<StartGameProvider>()
                                            //     .sayTheFullTalk(
                                            //         context: context);
                                          },
                                          child: state.stateOfAvatar ==
                                                      StateOfAvatar.talking &&
                                                  state.riveTalkingBoard != null
                                              ? Rive(
                                                  useArtboardSize: true,
                                                  artboard:
                                                      state.riveTalkingBoard!,
                                                  fit: BoxFit.fill,
                                                )
                                              : state.stateOfAvatar ==
                                                          StateOfAvatar
                                                              .thinking &&
                                                      state.riveThinkingDogBoard !=
                                                          null
                                                  ? Rive(
                                                      useArtboardSize: true,
                                                      artboard: state
                                                          .riveThinkingDogBoard!,
                                                      fit: BoxFit.fill,
                                                    )
                                                  : state.stateOfAvatar ==
                                                              StateOfAvatar
                                                                  .success &&
                                                          state.riveSuccessDogBoard !=
                                                              null
                                                      ? Rive(
                                                          useArtboardSize: true,
                                                          artboard: state
                                                              .riveSuccessDogBoard!,
                                                        )
                                                      : state.stateOfAvatar ==
                                                                  StateOfAvatar
                                                                      .wrong &&
                                                              state.riveWrongDogBoard !=
                                                                  null
                                                          ? Rive(
                                                              useArtboardSize:
                                                                  true,
                                                              artboard: state
                                                                  .riveWrongDogBoard!,
                                                            )
                                                          : state.riveThinkingDogBoard !=
                                                                  null
                                                              ? Rive(
                                                                  useArtboardSize:
                                                                      true,
                                                                  artboard: state
                                                                      .riveThinkingDogBoard!,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )
                                                              : SvgPicture
                                                                  .asset(
                                                                  AppImages
                                                                      .iconAvatarDog,
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height /
                                                                      3,
                                                                ),
                                        ),
                                      )),
                                  Positioned(
                                      top: 40,
                                      left: 10,
                                      child: IconButton(
                                          onPressed: () {
                                            // if (countOfFingers <= 1) {
                                            //   context
                                            //       .read<ChooseAvatarProvider>()
                                            //       .clearSelectedAvatar();
                                            //   Navigator.pop(context);
                                            // }
                                          },
                                          icon: Container(
                                            padding: const EdgeInsets.all(10),
                                            decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(50)),
                                                color: Colors.white),
                                            child: const Icon(
                                              Icons.arrow_back_ios_new,
                                              size: 15,
                                            ),
                                          ))),
                                  if (state.ttsState == TtsState.playing ||
                                      state.touchPositions.length > 1) ...{
                                    Container(
                                      color: Colors.transparent,
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                    )
                                  },
                                ])))))));
  }
}
