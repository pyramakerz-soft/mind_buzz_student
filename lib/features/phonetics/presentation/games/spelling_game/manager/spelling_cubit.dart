

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mind_buzz_refactor/core/phonetics/basic_of_every_game.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../domain/entities/game_letters_model.dart';
import '../../../../domain/entities/game_model.dart';

part 'spelling_state.dart';

class SpellingCubit extends Cubit<SpellingInitial> {
  // final GameModel gameData;
  final List<GameModel> allGames;
  final String background;
  final int index;
  SpellingCubit({required this.background, required this.index, required this.allGames})
      : super(SpellingInitial(woodenBackground: background,correctAnswers: const ['','',''])) {
    // gameData.gameLetters
    List<GameModel> tempAllGames = allGames.where((element) => element.isEdited == 0 && element.gameTypes?.name?.toLowerCase() == GameTypes.spelling.text()).toList();
    // gameData.ga
    print('tempAllGames:${tempAllGames.length}');
    emit(state.copyWith(gameData: tempAllGames,correctAnswers: ['','','']));
  }

  addTheCorrectAnswer({required String answer,required int index}) async {
    List<String> correctAnswer = state.correctAnswers;
    correctAnswer.removeAt(index);
    correctAnswer.insert(index , answer);
    emit(state.copyWith(correctAnswers: correctAnswer));

  }

  increaseCountOfCorrectAnswers() async {
    int sub = state.correctAnswer ?? 0;
    sub = sub + 1;
    emit(state.copyWith(correctAnswer: sub));
    return state.correctAnswer;
  }
  increaseIndexOfCorrectAnswers() async {
    int sub = state.index ?? 0;
    sub = sub + 1;
    emit(state.copyWith(index: sub));
    clearAnswers();
    return state.correctAnswer;
  }
   increaseCountOfWrongAnswers({int? count}) async {
    emit(state.copyWith(countOfWrong: count?? state.countOfWrong + 1));
  }

  clearAnswers(){
    emit(state.copyWith(correctAnswers: ['','','']));
  }

  bool checkIfIsTheLastGameOfLesson() {
    int currentIndex = state.index ?? 0;
    currentIndex = currentIndex + 1;
    print('currentIndex:${currentIndex}');

    if ((state.gameData?.length??0) > currentIndex &&
        (state.gameData?[currentIndex].gameTypes?.name?.toLowerCase() ==
            GameTypes.spelling.text().toLowerCase())) {
      return false;
    } else {
      return true;
    }
  }

  bool checkIsCorrectAnswer(){
   return state.gameData?[state.index].correctAns?.toLowerCase() == state.correctAnswers.join().toLowerCase();
  }
  bool checkCurrentFinished() {
    return state.gameData?[state.index].correctAns?.length == state.correctAnswers.join('').length;
  }
}
