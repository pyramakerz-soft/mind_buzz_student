import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/injection/injection_container.dart' as di;

import '../../../core/talk_tts.dart';
import '../../../core/utils.dart';
import '../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../../who_am_i/presentation/pages/who_am_i_screen.dart';
import '../mathematical_transactions/domain/entities/contact_of_lesson.dart';
import '../mathematical_transactions/presentation/manager/contact_lesson_bloc.dart';

class CurrentIndexCubit extends Cubit<int> {
  CurrentIndexCubit({this.dataOfLesson, this.index}) : super(index ?? 0);
  final List<ContactOfLessonModel>? dataOfLesson;
  final int? index;

  sayInstruction({required String message}) async {
    log('sayInstruction');
    await TalkTts.startTalk(text: message);
  }

  increaseIndex() {
    int i = state + 1;
    emit(i);
  }

  restartIndex() {
    emit(0);
  }

  checkCorrect(
      {required int correctAnswer,
      required int currentAnswer,
      required BuildContext context,
      required int totalCountOfQuestions}) {
    if ((totalCountOfQuestions - 1) == state) {
      Utils.navigateAndRemoveUntilTo(
          BlocProvider(create: (_) => WhoAmICubit(), child: WhoAmIScreen()),
          context);
    } else {
      log('checkCorrect:$correctAnswer:$currentAnswer');
      if (correctAnswer == currentAnswer) {
        increaseIndex();
      }
    }
  }
}
