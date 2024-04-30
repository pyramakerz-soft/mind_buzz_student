import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../../../core/assets_animation.dart';
import '../../../../core/assets_sound.dart';
import '../../../../core/audio_player.dart';
import '../../../../core/talk_tts.dart';
import '../../../../core/utils.dart';
import '../../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../../../who_am_i/presentation/pages/who_am_i_screen.dart';
import '../../domain/entities/lesson_questions.dart';
import 'current_game_state.dart';

class CurrentGameCubit extends Cubit<CurrentGameInitial> {
  CurrentGameCubit({this.index}) : super(CurrentGameInitial());
  final int? index;

  sayInstruction({required String message}) async {
    log('sayInstruction');
    await TalkTts.startTalk(text: message);
  }

  increaseIndex() {
    log('increaseIndex');
    int i = (state.index ?? 0) + 1;
    emit(state.copyWith(index: i));
  }

  restartIndex() {
    emit(state.copyWith(index: 0));
  }

  defaultActionOfSuccessAnswer() {
    emit(state.copyWith(activeButton: false));

    AudioPlayerClass.startPlaySound(soundPath: AppSound.rocketSound);
    emit(state.copyWith(
      activeButton: true,
    ));
  }

  defaultActionOfWrongAnswer() async {
    emit(state.copyWith(activeButton: false));

    increaseIndex();

    await AudioPlayerClass.startPlaySound(
        soundPath: AppSound.getRandomSoundOfWrong());
    emit(state.copyWith(
      activeButton: true,
    ));
  }

  getTheBackGround() {
    rootBundle.load(AppAnimation.beeRive).then(
      (data) async {
        try {
          final file = RiveFile.import(data);
          final artboard = file.mainArtboard;
          var controller =
              StateMachineController.fromArtboard(artboard, 'State Machine 1');

          if (controller != null) {
            artboard.addController(controller);
          }
          emit(state.copyWith(beeWinningArtboard: artboard));
        } catch (e) {
          log('###');
          log(e.toString());
        }
      },
    );
    // });
  }

  submitMessageAndTitle({required String? message, required String? title}) {
    emit(state.copyWith(message: message, title: title));
  }
}
