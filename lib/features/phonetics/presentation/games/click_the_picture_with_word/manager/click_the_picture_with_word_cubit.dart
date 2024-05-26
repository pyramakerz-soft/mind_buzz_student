import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    getTheRandomWord();
    emit(state.copyWith(gameDataPartOne: gameData.gameImages?.sublist(0, ((gameData.gameImages?.length??0)/2).ceil()), gameDataPartTwo:gameData.gameImages?.sublist(((gameData.gameImages?.length??0)/2).ceil(), gameData.gameImages?.length??0) ));
  }

  getTheRandomWord() async {
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

  submitCorrectTheAnswer(
      {required Function() winAnimation,
      required Function() reStateOfAvatar,
      required Function() actionWhenComplete,
      required Function(int correctAnswer) increaseCountOfCorrectAnswer,
      required int idOfUserAnswer}) async {
    await winAnimation();
    int sub = state.correctAnswer??0;
    sub = sub +1;
    emit(state.copyWith(correctAnswer: sub));
    increaseCountOfCorrectAnswer(sub);
    addTheCorrectAnswer(idOfUserAnswer: idOfUserAnswer);
    if((state.gameData.gameImages?.length??0) == sub){
      actionWhenComplete();
    }else {
      await reStateOfAvatar();
      await getTheRandomWord();
    }
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