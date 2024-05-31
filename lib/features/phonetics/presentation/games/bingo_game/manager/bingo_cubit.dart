import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../../../core/talk_tts.dart';
import '../../../../domain/entities/game_letters_model.dart';
import '../../../../domain/entities/game_model.dart';

part 'bingo_state.dart';

class BingoCubit extends Cubit<BingoInitial> {
  final GameModel _gameData;

  BingoCubit({required GameModel gameData})
      : _gameData = gameData,
        super(BingoInitial(gameData: gameData, stopAction: false)) {
    // bool haveNullId  =  (gameData.gameLetters ?? []).where((element) => element.id == null).toList().isNotEmpty;
    // if(haveNullId == false) {
    TalkTts.startTalk(text: _gameData.inst ?? '');

    List<GameLettersModel> supList = (_gameData.gameLetters ?? [])
        .where((element) => element.id != null)
        .toList();
    // supList.addAll(List.from(supList));
    supList.insert(4, GameLettersModel());
    emit(state.copyWith(cardsLetters: supList.toList()));
    // }
    getTheRandomWord(awaitTime: true);
  }

  Future<void> updateStopAction() async {
    print("-${state.stopAction}");
    emit(state.copyWith(stopAction: !state.stopAction));
    print("--${state.stopAction}");
  }

  getTheRandomWord({required bool awaitTime}) async {
    List<GameLettersModel> checkImages = [];

    state.cardsLetters?.forEach((element) {
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
      if (chooseWord.id == null) {
        getTheRandomWord(awaitTime: awaitTime);
        return;
      }
      if (awaitTime == true) {
        await Future.delayed(Duration(seconds: 1, milliseconds: 200));
      }
      await AudioPlayerClass.startPlaySound(
          soundPath: AppSound.getSoundOfLetter(
              mainGameLetter: chooseWord.letter?.toLowerCase() ?? ''));
      // await TalkTts.startTalk(text: chooseWord. ?? '');
      emit(state.copyWith(chooseWord: chooseWord));
    }
  }

  addTheCorrectAnswer({required int idOfUserAnswer}) async {
    List<int> correctAnswer = state.correctIndexes ?? [];
    correctAnswer.add(idOfUserAnswer);
    emit(state.copyWith(correctIndexes: correctAnswer));
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
    if (currentIndexOfAnswers != (currentIndexOfLetters - 1)) {
      return false;
    } else {
      return true;
    }
  }
}
