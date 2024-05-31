import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../../../core/talk_tts.dart';
import '../../../../domain/entities/game_letters_model.dart';
import '../../../../domain/entities/game_model.dart';

part 'sorting_cups_state.dart';

class SortingCupsCubit extends Cubit<SortingCupsInitial> {
  final GameModel gameData;

  SortingCupsCubit({required this.gameData})
      : super(SortingCupsInitial(gameData: gameData)) {
    List<GameLettersModel> cardsLetters = gameData.gameLetters ?? [];
    cardsLetters.shuffle();
    emit(state.copyWith(gameData: gameData, cardsLetters: cardsLetters));
    initStart();
  }

  initStart() async {
    await TalkTts.startTalk(text: state.gameData.inst ?? '');

    getTheRandomWord();
  }

  addTheCorrectAnswer({required int idOfUserAnswer}) async {
    List<int> correctAnswer = state.correctIndexes ?? [];
    print('correctAnswer:${correctAnswer.length}');
    correctAnswer.add(idOfUserAnswer);
    emit(state.copyWith(correctIndexes: correctAnswer));

    print('correctAnswer:${correctAnswer.length}');
  }

  bool checkIfIsTheLastGameOfLesson() {
    int currentIndexOfAnswers = state.correctIndexes?.length ?? 0;
    int currentIndexOfLetters = state.cardsLetters?.length ?? 0;
    if (currentIndexOfAnswers != (currentIndexOfLetters)) {
      return false;
    } else {
      return true;
    }
  }

  getTheRandomWord() async {
    print("getTheRandomWord");
    List<GameLettersModel> checkImages = [];

    state.gameData.gameLetters?.forEach((element) {
      print('element.id${element.id}');
      print('${state.correctIndexes}');
      if (state.correctIndexes == null ||
          (state.correctIndexes?.contains(element.id) == false)) {
        checkImages.add(element);
      }
    });
    int countOfTheImage = checkImages.length;
    if (countOfTheImage != 0) {
      Random random = Random();
      int randomNumber = random.nextInt(countOfTheImage);
      GameLettersModel chooseWord = checkImages[randomNumber];
      // if(chooseWord.id == null){
      //   getTheRandomWord(awaitTime:awaitTime);
      //   return ;
      // }
      // if(awaitTime==true) {
      //   await Future.delayed(Duration(seconds: 1, milliseconds: 200));
      // }
      await AudioPlayerClass.startPlaySound(
          soundPath: AppSound.getSoundOfLetter(
              mainGameLetter: chooseWord.letter?.toLowerCase() ?? ''));
      // await TalkTts.startTalk(text: chooseWord. ?? '');
      emit(state.copyWith(chooseWord: chooseWord));
    }
  }
}
