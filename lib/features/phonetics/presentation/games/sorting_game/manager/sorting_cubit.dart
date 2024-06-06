import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../../../core/talk_tts.dart';
import '../../../../domain/entities/game_images_model.dart';
import '../../../../domain/entities/game_letters_model.dart';
import '../../../../domain/entities/game_model.dart';

part 'sorting_state.dart';

class sortingCubit extends Cubit<sortingInitial> {
  final GameModel gameData;
  final List<GameModel> allGames;
  final String background;
  final int index;
  sortingCubit(
      {required this.gameData,
      required this.background,
      required this.index,
      required this.allGames})
      : super(sortingInitial(
            gameData: gameData,
            woodenBackground: background,
            currentImages: [],
            correctAnswersData: [],
            correctAnswers: [])) {
    emit(
        state.copyWith(cardsLetters: gameData.gameLetters, correctAnswers: []));
    changeImages();
    TalkTts.startTalk(text: state.gameData?.inst ?? '');
  }

  changeImages() {
    List<GameImagesModel> newList = (state.gameData?.gameImages ?? [])
        .where((element) => state.correctAnswers.contains(element.id) == false)
        .toList();
    newList.shuffle();
    emit(state.copyWith(currentImages: newList));
  }

  addTheCorrectAnswer({required GameImagesModel answer}) async {
    List<GameImagesModel> correctAnswersData = state.correctAnswersData;
    List<int> correctAnswers = state.correctAnswers;
    correctAnswersData.add(answer);
    List<GameImagesModel> newImagesList = state.currentImages ?? [];
    newImagesList.removeWhere((element) => element.id == answer.id);
    correctAnswers.add(answer.id ?? 0);
    emit(state.copyWith(
        correctAnswersData: correctAnswersData,
        currentImages: newImagesList,
        correctAnswers: correctAnswers));
  }

  addWrongAnswer() {
    List<GameImagesModel> currentImages = state.currentImages ?? [];
    List<GameImagesModel> wrongAnswers = state.wrongAnswers ?? [];
    wrongAnswers.addAll(currentImages);
    currentImages.clear();
    emit(state.copyWith(
        wrongAnswers: wrongAnswers, currentImages: currentImages));
  }

  clearAnswers() {
    emit(state.copyWith(correctAnswers: []));
  }

  bool checkIfIsTheLastGameOfLesson() {
    if ((state.correctAnswers.length + (state.wrongAnswers ?? []).length) ==
        (state.gameData?.gameImages?.length ?? 0)) {
      return true;
    } else {
      return false;
    }
  }

  // bool checkIsCorrectAnswer(,int letterId){
  //  return state.gameData?.gameImages;
  // }
}
