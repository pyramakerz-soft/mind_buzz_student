import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
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
            correctAnswers: [])) {
    changeImages();
    emit(
        state.copyWith(cardsLetters: gameData.gameLetters, correctAnswers: []));
  }

  changeImages() {
    List<GameImagesModel> newList = (state.gameData?.gameImages ?? [])
        .where((element) => !state.correctAnswers
        .map((e) => e.id)
        .toList()
        .contains(element.id))
        .toList()
      ..shuffle();
    if(newList.isNotEmpty) {
      if (state.currentImages?.isEmpty ?? true) {
        int currentStep = state.step;
        newList = newList.sublist(0, 4);
        emit(state.copyWith(step: currentStep + 1, currentImages: newList));
      }
    }
  }

  addTheCorrectAnswer({required GameImagesModel answer}) async {
    List<GameImagesModel> correctAnswer = state.correctAnswers;
    correctAnswer.add(answer);
    List<GameImagesModel> newImagesList = state.currentImages ?? [];
    newImagesList.remove(answer);
    emit(state.copyWith(
        correctAnswers: correctAnswer, currentImages: newImagesList));
  }
  removeTheWrongAnswer() async {
    List<GameImagesModel> newImagesList = state.currentImages ?? [];
    List<GameImagesModel> correctAnswer = state.correctAnswers;
    newImagesList.add(correctAnswer.last);
    correctAnswer.removeLast();
    emit(state.copyWith(
        correctAnswers: correctAnswer, currentImages: newImagesList));
  }

  increaseCountOfCorrectAnswers() async {
    int sub = state.correctAnswer ?? 0;
    sub = sub + 1;
    emit(state.copyWith(correctAnswer: sub));
    return state.correctAnswer;
  }

  increaseCountOfWrongAnswers({int? count}) async {
    emit(state.copyWith(countOfWrong: count ?? state.countOfWrong + 1));
  }

  clearAnswers() {
    emit(state.copyWith(correctAnswers: []));
  }

  bool checkIfIsTheLastGameOfLesson() {
    if (state.correctAnswers.length == (state.gameData?.gameImages?.length ?? 0)) {
      return true;
    } else {
      return false;
    }
  }

  // bool checkIsCorrectAnswer(,int letterId){
  //  return state.gameData?.gameImages;
  // }
}
