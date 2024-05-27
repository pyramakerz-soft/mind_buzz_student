

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../domain/entities/game_letters_model.dart';
import '../../../../domain/entities/game_model.dart';

part 'spelling_state.dart';

class SpellingCubit extends Cubit<SpellingInitial> {
  final GameModel gameData;
  final List<GameModel> allGames;
  final String background;
  final int index;
  SpellingCubit({required this.gameData, required this.background, required this.index, required this.allGames})
      : super(SpellingInitial(gameData: gameData,woodenBackground: background,correctAnswers: ['','',''])) {
    emit(state.copyWith(cardsLetters: gameData.gameLetters,correctAnswers: ['','','']));
  }
  navigateToNextIndex(){
    log((allGames.firstWhere((element) => element.id == state.gameData?.nextGameId)).toJson().toString());
    print('allGames.firstWhere((element) => element.id == state.gameData?.nextGameId).toJson()');
    emit(state.copyWith(gameData: allGames.firstWhere((element) => element.id == state.gameData?.nextGameId),correctAnswers: ['','','']));
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
   increaseCountOfWrongAnswers({int? count}) async {
    emit(state.copyWith(countOfWrong: count?? state.countOfWrong + 1));
  }

  clearAnswers(){
    emit(state.copyWith(correctAnswers: ['','','']));
  }

  bool checkIfIsTheLastGameOfLesson() {
      if (state.gameData?.nextGameId == null) {
        return true;
      } else {
        return false;
      }
  }

  bool checkIsCorrectAnswer(){
   return state.gameData?.correctAns?.toLowerCase() == state.correctAnswers.join().toLowerCase();
  }
  bool checkCurrentFinished() {
    return state.gameData?.correctAns?.length == state.correctAnswers.join('').length;
  }
}
