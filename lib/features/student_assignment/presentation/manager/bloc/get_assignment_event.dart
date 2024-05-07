part of 'get_assignment_bloc.dart';

@immutable
abstract class GetAssignmentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAssignmentRequest extends GetAssignmentEvent {
  final int programId;
  GetAssignmentRequest({required this.programId});

  @override
  List<Object> get props => [programId];
}
