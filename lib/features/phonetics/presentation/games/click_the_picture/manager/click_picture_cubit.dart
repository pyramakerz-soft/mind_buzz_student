import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../../../core/talk_tts.dart';
import '../../../../domain/entities/game_images_model.dart';
import '../../../../domain/entities/game_model.dart';
import '../../../manager/main_cubit/current_game_phonetics_cubit.dart';

part 'click_picture_state.dart';

class ClickPictureCubit extends Cubit<ClickPictureInitial> {
  final GameModel gameData;
  final List<String> background;
  List<int> correctIndexes = [];
  ClickPictureCubit({required this.gameData, required this.background})
      : super(ClickPictureInitial(
            gameData: gameData, backGround: background, correctIndexes: [])) {
    generateRandomPictures();
      sayTheLetter();
  }

  bool addAnswer(int index) {
      if (gameData.gameImages?[index].correct == 1) {
        emit(state);
        correctIndexes.add(index);
        emit(state.copyWith(correctIndexes: correctIndexes.toSet().toList()));
        return true;
      } else {
        return false;
      }

  }

  Future<void> generateRandomPictures() async {
    state.gameData.gameImages = state.gameData.gameImages?..shuffle();
    emit(state.copyWith(gameData: state.gameData ));
  }

  sayTheLetter() async {
    await TalkTts.startTalk(text: state.gameData.inst ?? '');
    await AudioPlayerClass.startPlaySound(soundPath: AppSound.getSoundOfLetter(mainGameLetter: state.gameData.mainLetter ?? ''));
  }

  checkCurrentClickTime({required DateTime current}){
    if (current.difference(state.currentPressTime ?? current) >  Duration(seconds: 1)) {
      emit(state.copyWith(currentPressTime: current));
      return true;
    }
    else {
      emit(state.copyWith(currentPressTime: current));
      return false;
    }
  }

}
