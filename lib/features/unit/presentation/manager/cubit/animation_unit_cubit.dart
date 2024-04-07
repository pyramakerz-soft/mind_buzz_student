import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../../../../core/assets_animation.dart';

part 'animation_unit_state.dart';

class AnimationUnitCubit extends Cubit<AnimationUnitInitial> {
  AnimationUnitCubit() : super(AnimationUnitInitial());

  animationBee1Avatar() {

    rootBundle.load(AppAnimation.unitsBee).then(
            (data) async {
          try {
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
            emit(state.copyWith(beeArtboard1: artboard));
          } catch (e) {
            log(e.toString());
          }
        },
      );
    Future.delayed(Duration(seconds: 5)).then((value){
      emit(state.clearBee1());

    });
  }

  animationBee2Avatar() {

    rootBundle.load(AppAnimation.unitsBee2).then(
          (data) async {
        try {
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
          emit(state.copyWith(beeArtboard2: artboard));
        } catch (e) {
          log(e.toString());
        }
      },
    );
    Future.delayed(Duration(seconds: 5)).then((value){
      emit(state.clearBee2());

    });
  }

  animationBeeWithWaterAvatar() {

    rootBundle.load(AppAnimation.unitsTree).then(
          (data) async {
        try {
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
          emit(state.copyWith(beeWaterArtboard: artboard));
        } catch (e) {
          log(e.toString());
        }
      },
    );
    Future.delayed(Duration(seconds: 5)).then((value){
      emit(state.clearBeeWaterArtboard());

    });
  }

  animationTreeAvatar() {
log('animationTreeAvatar');
    rootBundle.load(AppAnimation.unitsTree).then(
          (data) async {
        try {
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
          emit(state.copyWith(treeArtboard: artboard));
        } catch (e) {
          log(e.toString());
        }
      },
    );
    Future.delayed(Duration(seconds: 5)).then((value){
      emit(state.clearTree());

    });
  }


}
