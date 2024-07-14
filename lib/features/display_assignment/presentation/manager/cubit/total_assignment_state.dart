part of 'total_assignment_cubit.dart';

@immutable
class TotalAssignmentInitial extends Equatable {
  final int index;
  final List<GameFinalModel> assignmentData;
  final GameFinalModel? currentAssignment;

  TotalAssignmentInitial(
      {required this.index,
      required this.assignmentData,
      this.currentAssignment});
  TotalAssignmentInitial copyWith(
      {int? index,
      List<GameFinalModel>? assignmentData,
      GameFinalModel? currentAssignment}) {
    return TotalAssignmentInitial(
        assignmentData: assignmentData ?? this.assignmentData,
        index: index ?? this.index,
        currentAssignment: currentAssignment ?? this.currentAssignment);
  }

  @override
  List<Object?> get props => [assignmentData, index, currentAssignment];
}
