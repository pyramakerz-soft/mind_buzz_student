import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../../../core/assets_animation.dart';
import '../../../../core/utils.dart';
import '../../../games/presentation/bloc/general_game/game_cubit.dart';
import '../../../games/presentation/page/general_game.dart';

part 'choose_avatar_state.dart';

class ChooseAvatarCubit extends Cubit<ChooseAvatarInitial> {
  ChooseAvatarCubit() : super(ChooseAvatarInitial());
  submitSelectedAvatar(
      {required String newSelectedAvatar,
      required BuildContext context}) async {
    emit(state.copyWith(selectedAvatar: newSelectedAvatar));
    await Future.delayed(const Duration(seconds: 1));
    emit(state.clearSelectedAvatar());

    Utils.navigateTo(
        BlocProvider(
            create: (_) => GameCubit(avatarGame: newSelectedAvatar),
            child: Builder(builder: (context) {
              context.read<GameCubit>().startRiveAnimation();
              return BlocBuilder<GameCubit,
                  GameState>(builder: (context, state) {
                return const GeneralGame();
              });
            })


        ),
        context);

  }

  Artboard? riveArtboardAvatar;

  getTheDogAvatar() {
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
            emit(state.copyWith(riveArtboardAvatar: riveArtboardAvatar));
          } catch (e) {
            log(e.toString());
          }
        },
      );
    });
  }
}
