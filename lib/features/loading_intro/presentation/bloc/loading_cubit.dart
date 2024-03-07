import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../../../core/assets_animation.dart';

class LoadingCubit extends Cubit<Artboard?> {
  Artboard? riveArtboard;
  LoadingCubit() : super(null) {
    getTheBackGround();
  }

  getTheBackGround() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      rootBundle.load(AppAnimation.loadingRiv).then(
        // rootBundle.load(AppAnimations.pandaAnimation).then(
        (data) async {
          try {
            riveArtboard = null;
            // isDance = null;
            final file = RiveFile.import(data);
            final artboard = file.mainArtboard;

            var controller = StateMachineController.fromArtboard(
                artboard, 'State Machine 1');

            if (controller != null) {
              artboard.addController(controller);
              // isDance = controller.findSMI('success');
            }
            riveArtboard = artboard;
            emit(riveArtboard);
          } catch (e) {
            log(e.toString());
          }
        },
      );
    });
  }
}
