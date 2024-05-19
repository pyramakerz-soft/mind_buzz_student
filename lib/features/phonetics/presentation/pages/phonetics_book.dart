import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mind_buzz_refactor/core/vars.dart';
import '../../../../core/injection/injection_container.dart' as di;

import '../../../../core/error/failures_messages.dart';
import '../../../../core/phonetics/assets_images_phonetics.dart';
import '../../../../core/phonetics/basic_of_every_game.dart';
import '../../../../core/phonetics/basic_of_phonetics.dart';
import '../../../../core/utils.dart';
import '../../../login/presentation/page/login_screen.dart';
import '../games/drag_out/manager/drag_out_cubit.dart';
import '../games/drag_out/pages/drag_out_game.dart';
import '../manager/bloc/contact_lesson_bloc.dart';
import '../manager/main_cubit/current_game_phonetics_cubit.dart';
import '../widget/based_of_game_phonetics.dart';
import '../widget/star_widget.dart';

class PhoneticsBook extends StatefulWidget {
  final int lessonId;
  const PhoneticsBook({Key? key, required this.lessonId}) : super(key: key);
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
              ..add(GetContactLessonRequest(programId: widget.lessonId)),
            child: BlocProvider<CurrentGamePhoneticsCubit>(
                create: (_) => di.sl<CurrentGamePhoneticsCubit>(),
                child: BlocBuilder<CurrentGamePhoneticsCubit,
                        CurrentGamePhoneticsState>(
                    builder: (contextOfGame, stateOfGame) {
                  return BlocConsumer<ContactLessonBloc, ContactLessonState>(
                      listener: (context, state) {
                    if (state is GetContactErrorInitial) {
                      if (state.message == RELOGIN_FAILURE_MESSAGE) {
                        Utils.navigateAndRemoveUntilTo(LoginScreen(), context);
                      } else {
                        final snackBar = SnackBar(
                          content: Text(state.message),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    } else if (state is LogOutLoadingState) {
                      Navigator.of(context).pop();
                    } else if (state is GetContactInitial) {
                      MainDataOfPhonetics? dataType =
                          state.getMainContactData(index: stateOfGame.index);
                      if (dataType != null) {
                        context
                            .read<CurrentGamePhoneticsCubit>()
                            .updateDataOfCurrentGame(
                                basicData: dataType, gameData: state.data);
                      } else {
                        context
                            .read<ContactLessonBloc>()
                            .add(ThisTypeNotSupportedRequest());
                      }
                    }
                  }, builder: (context, stateOfGameData) {
                    if (stateOfGameData is GetContactInitial) {
                      // final stateOfGame =
                      //     context.watch<CurrentGamePhoneticsCubit>().state;
                      return BasedOfGamePhonetics(
                        stateOfGame: stateOfGame,
                        stateOfGameData: stateOfGameData,
                      );
                    } else if (stateOfGameData is GetContactLoadingInitial) {
                      return stateOfGame.avatarArtboardLoading != null
                          ? Rive(
                              artboard: stateOfGame.avatarArtboardLoading!,
                              fit: BoxFit.fill,
                            )
                          : const SizedBox();
                    } else if (stateOfGameData is NotSupportTypeState) {
                      return const Text('the data of game is not supported');
                    } else {
                      return const SizedBox();
                    }
                  });
                }))));
  }
}
