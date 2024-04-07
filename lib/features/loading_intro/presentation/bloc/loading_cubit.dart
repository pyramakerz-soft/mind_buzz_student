import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../../../core/assets_animation.dart';

class LoadingCubit extends Cubit<Artboard?> {
  Artboard? riveArtboard;
  LoadingCubit() : super(null){
    animationBeeLoadingAvatar();
  }

  animationBeeLoadingAvatar() {
    rootBundle.load(AppAnimation.beeLoadingBee).then(
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
            // isDance = controller.findSMI('success');
          }
          emit(artboard);
        } catch (e) {
          log(e.toString());
        }
      },
    );
  }

}
