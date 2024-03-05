import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/core/talk_tts.dart';
import 'package:rive/rive.dart';

import '../../../../core/assets_animation.dart';
import 'intro_state.dart';

class IntroCubit extends Cubit<IntroState> {
  Artboard? riveArtboardBees;

  IntroCubit() : super(IntroState());
  getTheBeesAvatar() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      rootBundle.load(AppAnimation.beeHiveRiv).then(
        (data) async {
          try {
            riveArtboardBees = null;
            final file = RiveFile.import(data);
            final artboard = file.mainArtboard;

            var controller = StateMachineController.fromArtboard(
                artboard, 'State Machine 1');
            if (controller != null) {
              artboard.addController(controller);
              // isDance = controller.findSMI('success');
            }
            riveArtboardBees = artboard;
            emit(state.copyWith(riveArtboardBees: riveArtboardBees));
          } catch (e) {
            log(e.toString());
          }
        },
      );
      // notifyListeners();
    });
  }

  Artboard? riveArtboardBeeCharacter;

  getTheBeeCharacterAvatar() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      rootBundle.load(AppAnimation.beeCharacterRiv1).then(
        (data) async {
          try {
            riveArtboardBeeCharacter = null;
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
            riveArtboardBeeCharacter = artboard;
            emit(state.copyWith(
                riveArtboardBeeCharacter: riveArtboardBeeCharacter));
          } catch (e) {
            log(e.toString());
          }
        },
      );
    });
  }

  startRiveAnimation() {
    getTheBeesAvatar();
    getTheBeeCharacterAvatar();
  }

  bool showTheButton = false;
  beeTalk() async {
    await TalkTts.startTalk(text: 'welcome to mind buzz');
    showTheButton = true;
    emit(state.copyWith(showTheButton: showTheButton));
  }

  saveAnimationController(
      {required AnimationController controller,
      required Animation<double> animation}) {
    emit(state.copyWith(controller: controller, animation: animation));
    state.controller?.forward(from: 0);
    state.controller?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        beeTalk();
      }
    });
  }

  updateThePositionOfButton({required double newPosition}) {
    emit(state.copyWith(position: newPosition));
  }
}
