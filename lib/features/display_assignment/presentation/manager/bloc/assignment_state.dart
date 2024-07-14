part of 'assignment_bloc.dart';

@immutable
class AssignmentState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AssignmentInitial extends AssignmentState {
  @override
  List<Object?> get props => [];
}

class AssignmentLoadingInitial extends AssignmentState {
  @override
  List<Object?> get props => [];
}

class AssignmentDataInitial extends AssignmentState {
  final List<GameFinalModel> data;

  AssignmentDataInitial({required this.data});
  @override
  List<Object?> get props => [data];
}

class AssignmentErrorInitial extends AssignmentState {
  final String message;

  AssignmentErrorInitial({required this.message});
  @override
  List<Object?> get props => [message];
}
