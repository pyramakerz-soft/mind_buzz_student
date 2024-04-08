import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/assets_sound.dart';
import '../../../../../../core/audio_player.dart';
import '../../../../domain/entities/lesson_questions.dart';

part 'beads_sum_mcq_state.dart';

class BeadsSumMcqCubit extends Cubit<BeadsSumMcqInitial> {
  final LessonQuestionsModel questionData;
  BeadsSumMcqCubit({required this.questionData}) : super(BeadsSumMcqInitial());

  checkCorrect(
      {
        required Function() actionOfSuccess,
        required Function() actionOfWrong,
        required int currentAnswer}) async {
    int correctAnswer = int.parse(questionData.control?.answer??'0');
    if (correctAnswer == currentAnswer) {
      await actionOfSuccess();
    } else {
     await actionOfWrong();

    }
  }

}
