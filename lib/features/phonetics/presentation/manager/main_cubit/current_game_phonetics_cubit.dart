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
    rootBundle.load(state.basicData?.idelAvatar??'').then(
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
    rootBundle.load(state.basicData?.winAvatar??'').then(
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
  getTheBackGroundad() {
    rootBundle.load(state.basicData?.sadAvatar??'').then(
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

  updateIndexOfCurrentGame() {
    int currentIndex = state.index;
    currentIndex = currentIndex + 1;
    emit(state.copyWith(index: currentIndex));
  }

  updateDataOfCurrentGame(
      {required MainDataOfPhonetics basicData,
      required List<GameModel> gameData}) {
    emit(state.copyWith(
        basicData: basicData,
        currentAvatar: basicData.basicAvatar,
        statesOfAddStars: BasicOfEveryGame.getTheStarsAddState(gameData.length),
        gameData: gameData));
    getTheBackGround();
    getTheBackGroundSuccess();
    getTheBackGroundad();
  }

  bool checkIfIsTheLastGameOfLesson() {
    int currentIndex = state.index;
    currentIndex = currentIndex + 1;
    if ((state.gameData?.length ?? 0) > currentIndex) {
      updateIndexOfCurrentGame();
      return false;
    } else {
      return true;
    }
  }


  addStarToStudent() {
    int stateOfCountOfCorrectAnswer = state.countOfCorrectAnswer ?? 0;
    int countOfStar = state.countOfStar ?? 0;
    List<int> stateOfStarsAdd = state.statesOfAddStars ?? [];
    if ((state.gameData?.length ?? 0) > 2) {
      if (stateOfStarsAdd[0] > stateOfCountOfCorrectAnswer) {
        if (stateOfStarsAdd[0] == stateOfCountOfCorrectAnswer) {
          emit(state.copyWith(countOfStar: (countOfStar + 1)));
        } else {
          if (stateOfStarsAdd[1] > stateOfCountOfCorrectAnswer) {
            if (stateOfStarsAdd[1] == stateOfCountOfCorrectAnswer) {
              emit(state.copyWith(countOfStar: (countOfStar + 1)));
            } else {
              if (stateOfStarsAdd[2] > stateOfCountOfCorrectAnswer) {
                if (stateOfStarsAdd[2] == stateOfCountOfCorrectAnswer) {
                  emit(state.copyWith(countOfStar: (countOfStar + 1)));
                }
              }
            }
          }
        }
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
  }

  addSuccessAnswer({required void Function() actionInEndOfLesson}) async {
    await animationOfCorrectAnswer();
    increaseCountOfCorrectAnswer();
    addStarToStudent();
    bool isLastLesson = checkIfIsTheLastGameOfLesson();

    if (isLastLesson == true) {
      await Future.delayed(const Duration(seconds: 2));
      actionInEndOfLesson.call();
    } else {
      backToMainAvatar();
    }
  }

  addWrongAnswer() async {
    AudioPlayerClass.startPlaySound(
        soundPath: AppSound.getRandomSoundOfWrong());
    animationOfWrongAnswer();
    backToMainAvatar();
  }

  animationOfWrongAnswer() {
    emit(state.copyWith(avatarArtboard: state.avatarArtboardSad));
  }

  animationOfCorrectAnswer() {
    emit(state.copyWith(avatarArtboard: state.avatarArtboardSuccess, stateOfAvatar: BasicOfEveryGame.stateOfWin));
  }

  increaseCountOfCorrectAnswer() {
    int stateOfCountOfCorrectAnswer = state.countOfCorrectAnswer ?? 0;
    stateOfCountOfCorrectAnswer = stateOfCountOfCorrectAnswer + 1;
    emit(state.copyWith(countOfCorrectAnswer: stateOfCountOfCorrectAnswer));
  }

  backToMainAvatar() async {
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(avatarArtboard: state.avatarArtboardIdle));
  }
}
