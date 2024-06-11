import 'dart:developer';

import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import 'package:mind_buzz_refactor/features/phonetics/presentation/widget/basic_of_games_arabic.dart';
import '../../../../core/games_structure/base_of_games.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/error/failures_messages.dart';
import '../../../../core/games_structure/phonetics/assets_images_phonetics.dart';
import '../../../../core/games_structure/phonetics/basic_of_game.dart';
import '../../../../core/games_structure/phonetics/basic_of_chapter.dart';
import '../../../../core/utils.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../games/drag_out/manager/drag_out_cubit.dart';
import '../games/drag_out/pages/drag_out_game.dart';
import '../manager/bloc/contact_lesson_bloc.dart';
import '../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../widget/based_of_game_connect.dart';
import '../widget/based_of_game_connect_sorting_cups.dart';
import '../widget/based_of_game_phonetics.dart';
import '../widget/star_widget.dart';
import '../widget/widget_of_tries.dart';

class PhoneticsBook extends StatefulWidget {
  final int lessonId;
  final int gameId;
  final bool firstTry;
  const PhoneticsBook(
      {Key? key,
      required this.lessonId,
      required this.gameId,
      this.firstTry = false})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _PhoneticsBook();
  }
}

class _PhoneticsBook extends State<PhoneticsBook> {
  @override
  void initState() {
    super.initState();
    // context.read<CurrentGameCubit>().getTheBackGround();
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
    return Scaffold(
        body: BlocProvider<ContactLessonBloc>(
            create: (_) => di.sl<ContactLessonBloc>()
              ..add(GetContactLessonRequest(
                  lessonId: widget.lessonId, gameId: widget.gameId)),
            child: BlocProvider<CurrentGamePhoneticsCubit>(
                create: (_) => di.sl<CurrentGamePhoneticsCubit>(),
                child: BlocConsumer<CurrentGamePhoneticsCubit,
                    CurrentGamePhoneticsState>(
                  listener: (BuildContext context,
                      CurrentGamePhoneticsState state) {},
                  builder: (contextOfGame, stateOfGame) {
                    final countOfFingers = contextOfGame
                        .watch<CurrentGamePhoneticsCubit>()
                        .touchPositions
                        .length;

                    return Listener(
                        onPointerDown: (opm) {
                          contextOfGame
                              .read<CurrentGamePhoneticsCubit>()
                              .savePointerPosition(opm.pointer, opm.position);
                        },
                        onPointerMove: (opm) {
                          contextOfGame
                              .read<CurrentGamePhoneticsCubit>()
                              .savePointerPosition(opm.pointer, opm.position);
                        },
                        onPointerCancel: (opm) {
                          contextOfGame
                              .read<CurrentGamePhoneticsCubit>()
                              .clearPointerPosition(opm.pointer);
                        },
                        onPointerUp: (opm) {
                          contextOfGame
                              .read<CurrentGamePhoneticsCubit>()
                              .clearPointerPosition(opm.pointer);
                        },
                        child: Stack(
                          children: [
                            BlocConsumer<ContactLessonBloc, ContactLessonState>(
                                listener: (context, state) {
                              if (state is GetContactErrorInitial) {
                                if (state.message == RELOGIN_FAILURE_MESSAGE) {
                                  Utils.navigateAndRemoveUntilTo(
                                      LoginScreen(), context);
                                } else {
                                  final snackBar = SnackBar(
                                    content: Text(state.message),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              } else if (state is LogOutLoadingState) {
                                Navigator.of(context).pop();
                              } else if (state is GetContactInitial) {
                                try {
                                  final dataType = state.getMainContactData(
                                      index: stateOfGame.index);

                                  print('dataType:$dataType');
                                  log('dataType:$dataType');
                                  if (dataType != null) {
                                    print('sadfsadf');
                                    context
                                        .read<CurrentGamePhoneticsCubit>()
                                        .updateDataOfCurrentGame(
                                            basicData: dataType,
                                            gameData: state.data,
                                            gameIndex: 0);
                                  } else {
                                    context
                                        .read<ContactLessonBloc>()
                                        .add(ThisTypeNotSupportedRequest());
                                  }
                                } catch (e) {
                                  print('error:$e');
                                  context
                                      .read<ContactLessonBloc>()
                                      .add(ThisTypeNotSupportedRequest());
                                }
                              }
                            }, builder: (context, stateOfGameData) {
                              if (stateOfGameData is GetContactInitial) {
                                return Stack(
                                  children: [
                                    if (stateOfGame.countOfTries != 0) ...{
                                      if (stateOfGame.basicData
                                          is MainDataOfChapters) ...{
                                        if (stateOfGame.basicData?.gameData
                                                ?.isConnect ==
                                            true) ...{
                                          if (stateOfGame.basicData
                                              is ConnectionSortingCups) ...{
                                            BasedOfGameConnectSortingCups(
                                              stateOfGame: stateOfGame,
                                              stateOfGameData: stateOfGameData,
                                            ),
                                          } else ...{
                                            BasedOfGameConnect(
                                              stateOfGame: stateOfGame,
                                              stateOfGameData: stateOfGameData,
                                            ),
                                          }
                                        } else if (BaseOfGames.isPhonetics(
                                            chapter: stateOfGame
                                                .basicData.runtimeType)) ...{
                                          BasedOfGamePhonetics(
                                            stateOfGame: stateOfGame,
                                            stateOfGameData: stateOfGameData,
                                          ),
                                        } else if (BaseOfGames.isArabic(
                                            chapter: stateOfGame
                                                .basicData.runtimeType)) ...{
                                          BasedOfGameArabic(
                                            stateOfGame: stateOfGame,
                                            stateOfGameData: stateOfGameData,
                                          ),
                                        },
                                      }
                                    } else if (stateOfGame.countOfTries ==
                                        0) ...{
                                      widgetOfTries(
                                        context: context,
                                        nextGameIndex: stateOfGameData.data
                                            .indexWhere((element) =>
                                                element.id == widget.gameId),
                                        stateOfGame: stateOfGame,
                                        actionOfDone: () {
                                          // Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        },
                                        backButton: () {
                                          // Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        },
                                      )
                                    }
                                    // },
                                  ],
                                );
                              } else if (stateOfGameData
                                  is GetContactLoadingInitial) {
                                return stateOfGame.avatarArtboardLoading != null
                                    ? Rive(
                                        artboard:
                                            stateOfGame.avatarArtboardLoading!,
                                        fit: BoxFit.fill,
                                      )
                                    : const SizedBox();
                              } else if (stateOfGameData
                                  is NotSupportTypeState) {
                                return const Text(
                                    'the data of game is not supported');
                              } else {
                                return const SizedBox();
                              }
                            }),
                            if (countOfFingers > 1 ||
                                (contextOfGame
                                            .watch<CurrentGamePhoneticsCubit>()
                                            .state
                                            .stateOfAvatar !=
                                        null &&
                                    contextOfGame
                                            .watch<CurrentGamePhoneticsCubit>()
                                            .state
                                            .stateOfAvatar !=
                                        BasicOfGame.stateOIdle)) ...{
                              Container(
                                color: Colors.transparent,
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                              )
                            }
                          ],
                        ));
                  },
                ))));
  }
}
