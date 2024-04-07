import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entities/lesson_questions.dart';
part 'beads_matching_state.dart';

class BeadsMatchingCubit extends Cubit<BeadsMatchingInitial> {
  final LessonQuestionsModel questionData;

  BeadsMatchingCubit({required this.questionData}) : super(BeadsMatchingInitial());
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
