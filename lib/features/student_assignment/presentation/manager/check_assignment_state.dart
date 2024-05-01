part of 'check_assignment_cubit.dart';

class CheckAssignmentInitial extends Equatable {
  final List<UserCourseModel>? assignmentProgrammes;

  const CheckAssignmentInitial({this.assignmentProgrammes});

  @override
  List<Object?> get props => [assignmentProgrammes];

  CheckAssignmentInitial copyWith(
      {List<UserCourseModel>? assignmentProgrammes}) {
    return CheckAssignmentInitial(
        assignmentProgrammes:
            assignmentProgrammes ?? this.assignmentProgrammes);
  }
}
