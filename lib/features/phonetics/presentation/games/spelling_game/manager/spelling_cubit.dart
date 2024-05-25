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
  final String background;

  SpellingCubit({required this.gameData, required this.background})
      : super(SpellingInitial(gameData: gameData,woodenBackground: background)) {
    // List<GameLettersModel> supList = gameData.gameLetters ?? [];
    // supList.addAll(List.from(supList));
    // supList.insert(4, GameLettersModel());
    emit(state.copyWith(cardsLetters: gameData.gameLetters?.toSet().toList()));
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
