import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

import '../../../core/assets_animation.dart';
import '../../../core/talk_tts.dart';
import '../../../core/utils.dart';
import '../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../../who_am_i/presentation/pages/who_am_i_screen.dart';
import '../mathematical_transactions/domain/entities/contact_of_lesson.dart';
import 'current_game_state.dart';

class CurrentGameCubit extends Cubit<CurrentGameInitial> {
  CurrentGameCubit({this.dataOfLesson, this.index})
      : super(CurrentGameInitial());
  final List<ContactOfLessonModel>? dataOfLesson;
  final int? index;

  sayInstruction({required String message}) async {
    log('sayInstruction');
    await TalkTts.startTalk(text: message);
  }

  increaseIndex() {
    int i = (state.index ?? 0) + 1;
    emit(state.copyWith(index: i));
  }

  restartIndex() {
    emit(state.copyWith(index: 0));
  }

  checkCorrect(
      {required int correctAnswer,
      required int currentAnswer,
      required BuildContext context,
      required int totalCountOfQuestions}) async {
    emit(state.copyWith(activeButton: false));
    log('checkCorrect:${state.giftBoxArtboard}');
    if (correctAnswer == currentAnswer) {
      rocketAnimationController.forward(); // Start the animation
      Future.delayed(const Duration(milliseconds: 1400)).then((value) {
        getTheBackGround();

        candyAnimationController.forward();
      });
      candyAnimationController.addStatusListener((status) {
        emit(state.copyWith(candyAnimationController: status));
        if (status == AnimationStatus.completed ||
            status == AnimationStatus.dismissed) {
          emit(state.clearGiftBoxArtboard());
        }
      });
      rocketAnimationController.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          if ((totalCountOfQuestions - 1) == state.index) {
            Utils.navigateAndRemoveUntilTo(
                BlocProvider(
                    create: (_) => WhoAmICubit(), child: const WhoAmIScreen()),
                context);
          } else {
            // emit(state.copyWith(giftBoxArtboard: null));
            increaseIndex();
            rocketAnimationController.reset();
            candyAnimationController.reset();
          }
        }
      });
    }

    emit(state.copyWith(
      activeButton: true,
    ));
    log('activeButton:${state.activeButton}');
  }

  late AnimationController rocketAnimationController;
  late Animation<Offset> rocketAnimationOffsetAnimation;

  late AnimationController candyAnimationController;
  late Animation<Offset> candyAnimationOffsetAnimation;

  getTheBackGround() {
    rootBundle.load(AppAnimation.giftBox).then(
      (data) async {
        try {
          final file = RiveFile.import(data);
          final artboard = file.mainArtboard;
          var controller =
              StateMachineController.fromArtboard(artboard, 'State Machine 1');

          if (controller != null) {
            artboard.addController(controller);
          }
          emit(state.copyWith(giftBoxArtboard: artboard));
        } catch (e) {
          log('###');
          log(e.toString());
        }
      },
    );
    // });
  }
}
