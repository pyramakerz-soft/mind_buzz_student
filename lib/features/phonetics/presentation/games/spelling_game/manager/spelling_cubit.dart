import 'dart:math';

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
      : super(SpellingInitial(gameData: gameData,woodenBackground: background)) {
    print('gameData.gameImages?.map((e) => e.image)');
    emit(state.copyWith(cardsLetters: gameData.gameLetters));
    // getTheRandomWord(awaitTime:true);
  }

  // getTheRandomWord({required bool awaitTime}) async {
  //   List<GameLettersModel> checkImages = [];
  //
  //
  //   state.cardsLetters?.forEach((element) {
  //     print('element.id${element.id}');
  //     print('${state.correctIndexes}');
  //     if (state.correctIndexes==null||(state.correctIndexes?.contains(element.id) == false)) {
  //       checkImages.add(element);
  //     }
  //   });
  //   int countOfTheImage = checkImages.length;
  //   if (countOfTheImage != 0) {
  //     Random random = Random();
  //     int randomNumber = random.nextInt(countOfTheImage);
  //     GameLettersModel chooseWord = checkImages[randomNumber];
  //     if(chooseWord.id == null){
  //       getTheRandomWord(awaitTime:awaitTime);
  //       return ;
  //     }
  //     if(awaitTime==true) {
  //       await Future.delayed(Duration(seconds: 1, milliseconds: 200));
  //     }
  //     await AudioPlayerClass.startPlaySound(soundPath:  AppSound.getSoundOfLetter(
  //         mainGameLetter: chooseWord.letter?.toLowerCase() ?? ''));
  //     // await TalkTts.startTalk(text: chooseWord. ?? '');
  //     emit(state.copyWith(chooseWord: chooseWord));
  //   }
  // }
  navigateToNextIndex(){
    emit(state.copyWith(gameData: allGames.firstWhere((element) => element.id == state.gameData?.nextGameId),correctAnswers: []));
  }

  addTheCorrectAnswer({required String answer}) async {
    List<String> correctAnswer = state.correctAnswers ?? [];
    print('correctAnswer:${correctAnswer.length}');
    correctAnswer.add(answer);
    emit(state.copyWith(correctAnswers: correctAnswer));

    print('correctAnswer:${correctAnswer.length}');
  }

  Future<int> increaseCountOfCorrectAnswers() async {
    int sub = state.correctAnswer ?? 0;
    sub = sub + 1;
    emit(state.copyWith(correctAnswer: sub));
    return Future.value(state.correctAnswer);
  }

  bool checkIfIsTheLastGameOfLesson() {
      if (state.gameData?.nextGameId == null) {
        return true;
      } else {
        return false;
      }
  }
  bool checkCurrentFinished() {
    return state.gameData?.correctAns?.split('').length == state.correctAnswers?.length;
  }
}
