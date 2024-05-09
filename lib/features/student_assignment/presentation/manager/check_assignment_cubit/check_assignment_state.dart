part of 'check_assignment_cubit.dart';

class CheckAssignmentInitial extends Equatable {
  final List<UserCourseModel>? assignmentProgrammes;
  final int? currentIndexOfSwitch;

  const CheckAssignmentInitial({this.currentIndexOfSwitch, this.assignmentProgrammes});

  @override
  List<Object?> get props => [assignmentProgrammes];

  CheckAssignmentInitial copyWith(
      {List<UserCourseModel>? assignmentProgrammes, int? currentIndexOfSwitch}) {
    return CheckAssignmentInitial(
        currentIndexOfSwitch: currentIndexOfSwitch?? this.currentIndexOfSwitch,
        assignmentProgrammes:
            assignmentProgrammes ?? this.assignmentProgrammes);
  }
}
