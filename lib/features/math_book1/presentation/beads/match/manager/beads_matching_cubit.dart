import 'dart:developer';
import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/lesson_questions.dart';
part 'beads_matching_state.dart';

class BeadsMatchingCubit extends Cubit<BeadsMatchingInitial> {
  final LessonQuestionsModel questionData;

  BeadsMatchingCubit({required this.questionData}) : super(BeadsMatchingInitial()){
   log('BeadsMatchingCubit') ;
  }
  checkCorrect(
      {
        required Function() actionOfSuccess,
        required Function() actionOfWrong,
        required int currentAnswer,
        required int correctAnswer}) async {
    // int correctAnswer = int.parse(questionData.control?.answer??'0');
    if (correctAnswer == currentAnswer) {
      await actionOfSuccess();
    } else {
      await actionOfWrong();

    }
  }
  updatedThePosition({required Offset position1, required Offset position2}){
    emit(state.copyWith(position1: position1, position2: position2));
  }
  clearPositions(){
    emit(state.clearPositionsState());
  }

}
