part of 'assignment_bloc.dart';

@immutable
class AssignmentEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetAssignmentDataEvent extends AssignmentEvent {
  final int programId;
  final int testId;

  GetAssignmentDataEvent({required this.programId, required this.testId});
  @override
  List<Object?> get props => [programId, testId];
}

class PostAssignmentDataEvent extends AssignmentEvent {
  final int testId;
  final int mistakeCount;
  final int stars;
  final int assignmentId;
  PostAssignmentDataEvent({required this.stars, required this.mistakeCount, required this.testId, required this.assignmentId});
  @override
  List<Object?> get props => [stars, mistakeCount, testId, assignmentId];
}
