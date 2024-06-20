import 'dart:developer';

import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:based_of_eng_game/based_of_eng_game.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/error/failures_messages.dart';
import '../../../../core/utils.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../manager/bloc/contact_lesson_bloc.dart';

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
            child: BlocConsumer<ContactLessonBloc, ContactLessonState> (
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
                          index: 0);

                      print('dataType:$dataType');
                      log('dataType:$dataType');
                      if (dataType == null) {
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
                return MainScreenOfGames(
                  stateOfGameData: stateOfGameData.data,
                  dataOfBasesGame:
                  stateOfGameData.getMainContactData(index: 0),
                  actionOfCompleteGame: (int countOfStars) {
                    // List<int> listOfIds = stateOfGameData.data;
                    List<int> listOfIds = stateOfGameData.data
                        .map((game) => game.id ?? 0)
                        .toList();
                    debugPrint(
                        '#########################################');
                    debugPrint(
                        'the stars send: $listOfIds , $countOfStars');
                    debugPrint(
                        '#########################################');
                  },
                  showTheEditedGames: false,
                );                              } else if (stateOfGameData
              is GetContactLoadingInitial) {
                // return stateOfGame.avatarArtboardLoading != null
                //     ? Rive(
                //   artboard:
                //   stateOfGame.avatarArtboardLoading!,
                //   fit: BoxFit.fill,
                // )
                //     :
                    return const SizedBox();
              } else if (stateOfGameData
              is NotSupportTypeState) {
                return const Text(
                    'the data of game is not supported');
              } else {
                return const SizedBox();
              }
            }),
        ));
  }
}
