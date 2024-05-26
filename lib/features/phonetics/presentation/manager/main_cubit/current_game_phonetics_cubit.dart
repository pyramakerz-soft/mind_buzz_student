import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../../../core/assets_animation.dart';
import '../../../../../core/assets_sound.dart';
import '../../../../../core/audio_player.dart';
import '../../../../../core/phonetics/assets_images_phonetics.dart';
import '../../../../../core/phonetics/basic_of_every_game.dart';
import '../../../../../core/phonetics/basic_of_phonetics.dart';
import '../../../domain/entities/game_model.dart';

part 'current_game_phonetics_state.dart';

class CurrentGamePhoneticsCubit extends Cubit<CurrentGamePhoneticsState> {

  CurrentGamePhoneticsCubit() : super(CurrentGamePhoneticsState(index: 0)) {
    getTheBackGroundLoading();
  }

  getTheBackGround() {
    print('state.basicData?.idelAvatar:${state.basicData?.idelAvatar}');
    rootBundle.load(state.basicData?.idelAvatar ?? '').then(
      (data) async {
        try {
          final file = RiveFile.import(data);
          final artboard = file.mainArtboard;
          var controller =
              StateMachineController.fromArtboard(artboard, 'State Machine 1');

          if (controller != null) {
            artboard.addController(controller);
          }
          emit(state.copyWith(avatarArtboardIdle: artboard));
          emit(state.copyWith(avatarArtboard: state.avatarArtboardIdle));
        } catch (e) {
          log('###');
          log(e.toString());
        }
      },
    );
  }

  getTheBackGroundSuccess() {
    rootBundle.load(state.basicData?.winAvatar ?? '').then(
      (data) async {
        try {
          final file = RiveFile.import(data);
          final artboard = file.mainArtboard;
          var controller =
              StateMachineController.fromArtboard(artboard, 'State Machine 1');

          if (controller != null) {
            artboard.addController(controller);
          }
          emit(state.copyWith(avatarArtboardSuccess: artboard));
        } catch (e) {
          log('###');
          log(e.toString());
        }
      },
    );
  }

  getTheBackGroundSad() {
    rootBundle.load(state.basicData?.sadAvatar ?? '').then(
      (data) async {
        try {
          final file = RiveFile.import(data);
          final artboard = file.mainArtboard;
          var controller =
              StateMachineController.fromArtboard(artboard, 'State Machine 1');

          if (controller != null) {
            artboard.addController(controller);
          }
          emit(state.copyWith(avatarArtboardSad: artboard));
        } catch (e) {
          log('###');
          log(e.toString());
        }
      },
    );
  }

  getTheBackGroundLoading() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      rootBundle.load(AppImagesPhonetics.loadingRiv).then(
        (data) async {
          try {
            final file = RiveFile.import(data);
            final artboard = file.mainArtboard;

            var controller = StateMachineController.fromArtboard(
                artboard, 'State Machine 1');
            controller?.inputs.forEach((element) {
              log('element:${element.name}');
            });
            if (controller != null) {
              artboard.addController(controller);
            }
            emit(state.copyWith(avatarArtboardLoading: artboard));
          } catch (e) {
            log(e.toString());
          }
        },
      );
    });
  }

  updateIndexOfCurrentGame({required int nextIndex}) {
    // int currentIndex = state.index;
    // currentIndex = currentIndex + 1;
    emit(state.copyWith(index: nextIndex));
  }

  updateDataOfCurrentGame(
      {required MainDataOfPhonetics basicData,
      required List<GameModel> gameData,
      required int gameIndex}) {
    emit(state.copyWith(
        basicData: basicData,
        currentAvatar: basicData.basicAvatar,
        index: gameIndex,
        gameData: gameData));
    saveCountOfTries();
    getTheBackGround();
    getTheBackGroundSuccess();
    getTheBackGroundSad();
  }

  saveCountOfTries(){
    int countOfTries = 3;//state.gameData?[state.index].numOfTrials??0;
    emit(state.copyWith(countOfTries:countOfTries, countOfStar: 0));
  }

  decreaseCountOfTries(){
    int countOfTries = (state.countOfTries??1)-1;
    emit(state.copyWith(countOfTries:countOfTries));
  }

  bool checkIfIsTheLastGameOfLesson() {
    int currentIndex = state.index;
    currentIndex = currentIndex + 1;
    if ((state.gameData?.length ?? 0) > currentIndex) {
      return false;
    } else {
      return true;
    }
  }

  addStarToStudent(
      {required int stateOfCountOfCorrectAnswer,
      required int mainCountOfQuestion}) {
    int countOfStar = state.countOfStar ?? 0;
    List<int> stateOfStarsAdd =
        BasicOfEveryGame.getTheStarsAddState(mainCountOfQuestion);
    if ((mainCountOfQuestion) > 2) {
      if (stateOfStarsAdd[0] == stateOfCountOfCorrectAnswer) {
        emit(state.copyWith(countOfStar: (countOfStar + 1)));
      } else if ((stateOfStarsAdd[1] + stateOfStarsAdd[0]) ==
          stateOfCountOfCorrectAnswer) {
        emit(state.copyWith(countOfStar: (countOfStar + 1)));
      } else if ((stateOfStarsAdd[2] +
              stateOfStarsAdd[0] +
              stateOfStarsAdd[1]) ==
          stateOfCountOfCorrectAnswer) {
        emit(state.copyWith(countOfStar: (countOfStar + 1)));
      }
    } else {
      if (state.gameData?.length == 1) {
        emit(state.copyWith(countOfStar: 3));
      } else if (state.gameData?.length == 2) {
        if (stateOfCountOfCorrectAnswer == 1) {
          emit(state.copyWith(countOfStar: 1));
        } else if (stateOfCountOfCorrectAnswer == 2) {
          emit(state.copyWith(countOfStar: 3));
        }
      }
    }
    print('countOfStar:$countOfStar');
  }

  increaseDirectlyCountOfStar() {
    int countOfStar = state.countOfStar ?? 0;
    emit(state.copyWith(countOfStar: (countOfStar + 1)));
  }

  addSuccessAnswer({required void Function() actionInEndOfLesson,int? nextGameId}) async {
    await animationOfCorrectAnswer();

    bool isLastLesson = checkIfIsTheLastGameOfLesson();

    if (isLastLesson == true) {
      await Future.delayed(const Duration(seconds: 2));
      actionInEndOfLesson.call();
    } else {
      await backToMainAvatar();
      if(nextGameId!=null)
      updateIndexOfCurrentGame(nextIndex: state.gameData!.indexWhere((element) => element.id == nextGameId));
      print('${state.stateOfAvatar}');
    }
  }

  Future<void> addWrongAnswer({void Function()? actionOfWrongAnswer}) async {
    await AudioPlayerClass.startPlaySound(
        soundPath: AppSound.getRandomSoundOfWrong());
    await animationOfWrongAnswer();
    if (actionOfWrongAnswer != null) {
      AudioPlayerClass.player.onPlayerComplete.listen((event) {
        actionOfWrongAnswer.call();
      });
    }
    await backToMainAvatar();
  }

  animationOfWrongAnswer() {

    emit(state.copyWith(
        avatarArtboard: state.avatarArtboardSad,
        stateOfAvatar: BasicOfEveryGame.stateOfSad));
    decreaseCountOfTries();
  }

  animationOfCorrectAnswer() {
    emit(state.copyWith(
        avatarArtboard: state.avatarArtboardSuccess,
        stateOfAvatar: BasicOfEveryGame.stateOfWin));
  }

  increaseCountOfCorrectAnswer() {
    int stateOfCountOfCorrectAnswer = state.countOfCorrectAnswer ?? 0;
    stateOfCountOfCorrectAnswer = stateOfCountOfCorrectAnswer + 1;
    emit(state.copyWith(countOfCorrectAnswer: stateOfCountOfCorrectAnswer));
  }

  backToMainAvatar() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
        avatarArtboard: state.avatarArtboardIdle,
        stateOfAvatar: BasicOfEveryGame.stateOIdle));
  }



  Map<int, Offset> touchPositions = <int, Offset>{};
  void savePointerPosition(int index, Offset position) {
    touchPositions[index] = position;
    emit(state.copyWith(touchPositions: !(state.touchPositions??false)));
  }
  clearPointerPosition(int index) {
    touchPositions.remove(index);
    emit(state.copyWith(touchPositions: !(state.touchPositions??false)));
  }
}