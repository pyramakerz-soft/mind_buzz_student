import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../../../../core/assets_animation.dart';
import '../../../../../core/audio_player.dart';
import '../../../../../core/game_structure.dart';
import '../../../../../core/talk_tts.dart';
import '../../../../../core/vars.dart';
import '../../../domain/entities/details_of_answer_model.dart';
import '../../../domain/entities/result_model.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit({required this.avatarGame}) : super(GameState());
  final String avatarGame;

  startRiveAnimation() {
    getTheTalkingDogGround();
    getTheSuccessDogGround();
    getTheThinkingDogGround();
    getTheWrongDogGround();
  }

  getTheTalkingDogGround() {
    Artboard? riveTalkingBoard;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      rootBundle.load(AppAnimation.talkingDogRiv).then(
        // rootBundle.load(AppAnimations.pandaAnimation).then(
        (data) async {
          try {
            riveTalkingBoard = null;
            // isDance = null;
            final file = RiveFile.import(data);
            final artboard = file.mainArtboard;

            var controller = StateMachineController.fromArtboard(
                artboard, 'State Machine 1');

            if (controller != null) {
              artboard.addController(controller);
            }
            riveTalkingBoard = artboard;
            emit(state.copyWith(riveTalkingBoard: riveTalkingBoard));
          } catch (e) {
            log('error:$e');
          }
        },
      );
    });
  }

  getTheSuccessDogGround() {
    Artboard? riveSuccessDogBoard;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      rootBundle.load(AppAnimation.successDogRiv).then(
        (data) async {
          try {
            riveSuccessDogBoard = null;
            // isDance = null;
            final file = RiveFile.import(data);
            final artboard = file.mainArtboard;

            var controller = StateMachineController.fromArtboard(
                artboard, 'State Machine 1');
            controller?.inputs.forEach((element) {
              log('element:${element.name}');
            });
            if (controller != null) {
              artboard.addController(controller);
              // isDance = controller.findSMI('success');
            }
            riveSuccessDogBoard = artboard;

            emit(state.copyWith(riveSuccessDogBoard: riveSuccessDogBoard));
          } catch (e) {
            log('error:$e');
          }
        },
      );
    });
  }

  getTheThinkingDogGround() {
    Artboard? riveThinkingDogBoard;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      rootBundle.load(AppAnimation.thinkingDogRiv).then(
        // rootBundle.load(AppAnimations.pandaAnimation).then(
        (data) async {
          try {
            riveThinkingDogBoard = null;
            // isDance = null;
            final file = RiveFile.import(data);
            final artboard = file.mainArtboard;

            var controller = StateMachineController.fromArtboard(
                artboard, 'State Machine 1');

            if (controller != null) {
              artboard.addController(controller);
            }
            riveThinkingDogBoard = artboard;
            emit(state.copyWith(riveThinkingDogBoard: riveThinkingDogBoard));
          } catch (e) {
            log('error:$e');
          }
        },
      );
    });
  }

  getTheWrongDogGround() {
    Artboard? riveWrongDogBoard;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      rootBundle.load(AppAnimation.failureDogGif).then(
        // rootBundle.load(AppAnimations.pandaAnimation).then(
        (data) async {
          try {
            riveWrongDogBoard = null;
            final file = RiveFile.import(data);
            final artboard = file.mainArtboard;

            var controller = StateMachineController.fromArtboard(
                artboard, 'State Machine 1');

            if (controller != null) {
              artboard.addController(controller);
            }
            riveWrongDogBoard = artboard;
            emit(state.copyWith(riveWrongDogBoard: riveWrongDogBoard));
          } catch (e) {
            log('error:$e');
          }
        },
      );
    });
  }

  updateToSuccess() {
    emit(state.copyWith(stateOfAvatar: StateOfAvatar.success));
  }

  updateToTaking() {
    emit(state.copyWith(stateOfAvatar: StateOfAvatar.talking));
  }

  updateToWrong() {
    emit(state.copyWith(stateOfAvatar: StateOfAvatar.wrong));
  }

  updateToStop({bool? dontWaitDelayed}) async {
    if (dontWaitDelayed != true) {
      await Future.delayed(const Duration(seconds: 1, milliseconds: 200));
    }
    emit(state.copyWith(stateOfAvatar: StateOfAvatar.stop));
  }

  beeTalkOfCongratulation() async {
    TalkTts.startTalk(text: 'Congratulation');
  }

  Map<int, Offset> touchPositions = <int, Offset>{};

  void savePointerPosition(int index, Offset position) {
    touchPositions[index] = position;
    emit(state.copyWith(touchPositions: touchPositions));
  }

  void clearPointerPosition(int index) {
    touchPositions.remove(index);
    emit(state.copyWith(touchPositions: touchPositions));
  }

  saveStateGameTime({required DateTime newScreenOpenTime}) {
    emit(state.copyWith(screenOpenTime: newScreenOpenTime));
  }

  List<ResultModel> dataOfResult = [];
  addTheStateOfCurrentAnswer(
      {required BuildContext context,
      required String userAnswer,
      required String correctAnswer}) {
    ResultModel lastResultModel = dataOfResult.last;
    lastResultModel.detailsOfAnswers?.add(DetailsOfAnswerModel(
        correctAnswer: correctAnswer,
        userAnswer: userAnswer,
        dateTimeOfAnswer: DateTime.now(),
        timeOfAnswer: GameStructure.getTheDifferentTimeOfAnswers(
            lastResultModel: lastResultModel,
            screenOpenTime: state.screenOpenTime)));
  }

  late AnimationController controllerAnimation;
  late Animation<double> animation;
  int repeatCount = 0;

  late AnimationController animationControllerCelebration;
  late Animation<Offset> animationCelebration;
  startAnimationOfCelebration() {
    animationControllerCelebration.reset();
    animationControllerCelebration.repeat(reverse: true);
  }

  stopPlayMusic() async {
    await TalkTts.stopTalk();
    await AudioPlayerClass.forceStopSound();
  }
}
