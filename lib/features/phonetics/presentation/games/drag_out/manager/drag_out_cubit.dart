import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../../../core/games_structure/phonetics/basic_of_game.dart';
import '../../../../../../core/talk_tts.dart';
import '../../../../domain/entities/game_model.dart';

part 'drag_out_state.dart';

class DragOutCubit extends Cubit<DragOutInitial> {
  final List<GameModel> gameData;
  DragOutCubit({required this.gameData})
      : super(DragOutInitial(gameData: gameData)) {
    // TalkTts.startTalk(text: gameData.mainLetter ?? '');
    // getTheFirstDragOut();

    // List<GameModel> supGameData = gameData
    //     .where((element) =>
    //         element.gameTypes?.name?.toLowerCase() ==
    //         GameTypes.dragOut.text().toLowerCase())
    //     .toList();
    emit(state.copyWith(gameData: gameData));
    sayLetter();
  }

  Future<int> increaseCountOfCorrectAnswers() async {
    int sub = state.correctAnswer ?? 0;
    sub = sub + 1;
    emit(state.copyWith(correctAnswer: sub));
    return Future.value(state.correctAnswer);
  }

  bool checkIfIsTheLastGameOfLesson() {
    int currentIndex = state.index ?? 0;
    currentIndex = currentIndex + 1;

    if ((state.gameData.length) > currentIndex) {
      return false;
    } else {
      return true;
    }
  }

  updateIndexOfCurrentGame() {
    int currentIndex = state.index ?? 0;
    currentIndex = currentIndex + 1;
    emit(state.copyWith(index: currentIndex));
  }
  sayLetter() async {
    await TalkTts.startTalk(text: state.gameData.first.inst ?? '');

    await AudioPlayerClass.startPlaySound(soundPath: AppSound.getSoundOfLetter(mainGameLetter: state.gameData?.first.mainLetter ?? ''));

  }
}
