part of 'beads_sum_mcq_cubit.dart';

class BeadsSumMcqInitial extends Equatable {
  bool? activeButton = true;
  LessonQuestionsModel? questionData;
  BeadsSumMcqInitial({this.activeButton, this.questionData});
  BeadsSumMcqInitial copyWith({
    bool? activeButton,
    LessonQuestionsModel? questionData
  }) {
    return BeadsSumMcqInitial(activeButton: activeButton ?? this.activeButton,
        questionData: questionData ?? this.questionData);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [activeButton, questionData];
}
