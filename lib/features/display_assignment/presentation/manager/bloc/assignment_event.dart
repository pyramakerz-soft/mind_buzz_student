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
