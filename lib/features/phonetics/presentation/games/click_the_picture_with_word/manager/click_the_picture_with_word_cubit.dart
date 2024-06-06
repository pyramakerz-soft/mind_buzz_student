import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../../../core/talk_tts.dart';
import '../../../../domain/entities/game_images_model.dart';
import '../../../../domain/entities/game_letters_model.dart';
import '../../../../domain/entities/game_model.dart';
part 'click_the_picture_with_word_state.dart';

class ClickThePictureWithWordCubit
    extends Cubit<ClickThePictureWithWordInitial> {
  final GameModel gameData;
  final List<String> backGround;
  ClickThePictureWithWordCubit(
      {required this.gameData, required this.backGround})
      : super(ClickThePictureWithWordInitial(
            gameData: gameData, backGround: backGround, correctIndexes: [])) {
    startGame();

    List<GameImagesModel> tempGameImages = gameData.gameImages??[];
    tempGameImages.shuffle();
    emit(state.copyWith(
        gameDataPartOne: tempGameImages.sublist(0, ((gameData.gameImages?.length??0)/2).ceil()),
        gameDataPartTwo:tempGameImages.sublist(((gameData.gameImages?.length??0)/2).ceil(),
            tempGameImages.length??0) ));
  }

  startGame() async {
    await TalkTts.startTalk(text: gameData.inst ?? '');
      await getTheRandomWord();

  }
  getTheRandomWord() async {
    print('getTheRandomWord:');
    List<GameImagesModel> checkImages = [];
    state.gameData.gameImages?.forEach((element) {
      if (state.correctIndexes.contains(element.id) == false) {
        checkImages.add(element);
      }
    });
    int countOfTheImage = checkImages.length;
    if (countOfTheImage != 0) {
      Random random = Random();
      int randomNumber = random.nextInt(countOfTheImage);
      GameImagesModel chooseWord = checkImages[randomNumber];
      await TalkTts.startTalk(text: chooseWord.word ?? '');
      emit(state.copyWith(chooseWord: chooseWord));
    }
  }

  addTheCorrectAnswer({required int idOfUserAnswer}) async {
    List<int> correctAnswer = state.correctIndexes;
    correctAnswer.add(idOfUserAnswer);
    state.copyWith(correctIndexes: correctAnswer);
  }

  submitCorrectTheAnswer() async {
    int sub = state.correctAnswer??0;
    sub = sub +1;
    emit(state.copyWith(correctAnswer: sub));

  }
  submitWrongTheAnswer(
      {required Function() wrongAnimation,
      required Function() reStateOfAvatar}) {
    wrongAnimation();
    reStateOfAvatar();
  }


  sayTheCorrectAnswer() async {
    await TalkTts.startTalk(text: state.chooseWord?.word ?? '');
  }
}
