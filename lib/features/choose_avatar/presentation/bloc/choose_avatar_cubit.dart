import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:rive/rive.dart';

import '../../../../core/assets_animation.dart';

part 'choose_avatar_state.dart';

class ChooseAvatarCubit extends Cubit<ChooseAvatarInitial> {
  ChooseAvatarCubit() : super(const ChooseAvatarInitial());
  submitSelectedAvatar({required String newSelectedAvatar,
    required BuildContext context}) async {
    emit(state.copyWith(selectedAvatar:newSelectedAvatar));
    await Future.delayed(const Duration(seconds: 1));

    // Utils.navigateTo(
    //     ChangeNotifierProvider<StartGameProvider>(
    //         create: (context) =>
    //             StartGameProvider(pathOfCurrentAvatar: newSelectedAvatar),
    //         child: ChangeNotifierProvider<ChooseAvatarProvider>.value(
    //             value: p, child: const QuestionsScreen())),
    //     context);
  }
  Artboard? riveArtboardAvatar;

  getTheDogAvatar(){

    WidgetsBinding.instance.addPostFrameCallback((_) {
      rootBundle.load(AppAnimation.avatarDogRiv).then(
            (data) async {
          try {

            riveArtboardAvatar = null;
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
            riveArtboardAvatar = artboard;
            emit(state.copyWith(riveArtboardAvatar:riveArtboardAvatar));
          } catch (e) {
            log(e.toString());
          }
        },
      );
    });
  }

}
