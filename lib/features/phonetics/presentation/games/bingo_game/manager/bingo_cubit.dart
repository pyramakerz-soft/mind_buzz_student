import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../domain/entities/game_letters_model.dart';
import '../../../../domain/entities/game_model.dart';

part 'bingo_state.dart';

class BingoCubit extends Cubit<BingoInitial> {
  final GameModel gameData;

  BingoCubit({required this.gameData})
      : super(BingoInitial(gameData: gameData)) {
    // bool haveNullId  =  (gameData.gameLetters ?? []).where((element) => element.id == null).toList().isNotEmpty;
    // if(haveNullId == false) {
      List<GameLettersModel> supList = (gameData.gameLetters ?? []).where((element) => element.id != null).toList();
      // supList.addAll(List.from(supList));
      supList.insert(4, GameLettersModel());
      emit(state.copyWith(cardsLetters: supList.toList()));
    // }
    print("supList:${state.cardsLetters?.length}");
    getTheRandomWord(awaitTime:true);
  }

  updateStopAction(){
    emit(state.copyWith(stopAction: !(state.stopAction??false)));
  }
  getTheRandomWord({required bool awaitTime}) async {
    List<GameLettersModel> checkImages = [];


    state.cardsLetters?.forEach((element) {
      print('element.id${element.id}');
      print('${state.correctIndexes}');
      if (state.correctIndexes==null||(state.correctIndexes?.contains(element.id) == false)) {
        checkImages.add(element);
      }
    });
    int countOfTheImage = checkImages.length;
    if (countOfTheImage != 0) {
      Random random = Random();
      int randomNumber = random.nextInt(countOfTheImage);
      GameLettersModel chooseWord = checkImages[randomNumber];
      if(chooseWord.id == null){
        getTheRandomWord(awaitTime:awaitTime);
        return ;
      }
      if(awaitTime==true) {
        await Future.delayed(Duration(seconds: 1, milliseconds: 200));
      }
      await AudioPlayerClass.startPlaySound(soundPath:  AppSound.getSoundOfLetter(
          mainGameLetter: chooseWord.letter?.toLowerCase() ?? ''));
      // await TalkTts.startTalk(text: chooseWord. ?? '');
      emit(state.copyWith(chooseWord: chooseWord));
    }
  }

  addTheCorrectAnswer({required int idOfUserAnswer}) async {
    List<int> correctAnswer = state.correctIndexes ?? [];
    print('correctAnswer:${correctAnswer.length}');
    correctAnswer.add(idOfUserAnswer);
    emit(state.copyWith(correctIndexes: correctAnswer));

    print('correctAnswer:${correctAnswer.length}');
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
    if (currentIndexOfAnswers != (currentIndexOfLetters-1)) {
      return false;
    } else {
      return true;
    }
  }
}
