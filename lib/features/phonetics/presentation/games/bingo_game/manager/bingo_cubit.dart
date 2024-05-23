import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../domain/entities/game_letters_model.dart';
import '../../../../domain/entities/game_model.dart';

part 'bingo_state.dart';

class BingoCubit extends Cubit<BingoInitial> {
  final GameModel gameData;

  BingoCubit({required this.gameData})
      : super(BingoInitial(gameData: gameData)) {
    List<GameLettersModel> supList = gameData.gameLetters ?? [];
    supList.addAll(List.from(supList));
    supList.insert(4, GameLettersModel());
    emit(state.copyWith(cardsLetters: supList.toList()));
    getTheRandomWord();
  }

  getTheRandomWord() async {
    List<GameLettersModel> checkImages = [];
    state.cardsLetters?.forEach((element) {
      if (state.correctIndexes?.contains(element.id) == false) {
        checkImages.add(element);
      }
    });
    int countOfTheImage = checkImages.length;
    if (countOfTheImage != 0) {
      Random random = Random();
      int randomNumber = random.nextInt(countOfTheImage);
      GameLettersModel chooseWord = checkImages[randomNumber];
      await AppSound.getSoundOfLetter(
          mainGameLetter: chooseWord.letter?.toLowerCase() ?? '');
      // await TalkTts.startTalk(text: chooseWord. ?? '');
      emit(state.copyWith(chooseWord: chooseWord));
    }
  }

  addTheCorrectAnswer({required int idOfUserAnswer}) async {
    List<int> correctAnswer = state.correctIndexes ?? [];
    correctAnswer.add(idOfUserAnswer);
    state.copyWith(correctIndexes: correctAnswer);
  }

  Future<int> increaseCountOfCorrectAnswers() async {
    int sub = state.correctAnswer ?? 0;
    sub = sub + 1;
    emit(state.copyWith(correctAnswer: sub));
    return Future.value(state.correctAnswer);
  }

  bool checkIfIsTheLastGameOfLesson() {
    int currentIndexOfAnswers = state.correctIndexes?.length ?? 0;
    int currentIndexOfLetters = state.cardsLetters?.length ?? 0;
    if (currentIndexOfAnswers != currentIndexOfLetters) {
      return false;
    } else {
      return true;
    }
  }
}
