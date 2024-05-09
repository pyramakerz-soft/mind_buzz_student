part of 'get_assignment_bloc.dart';

@immutable
abstract class GetAssignmentState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAssignmentInitial extends GetAssignmentState {}

class GetProgramsCompleteInitial extends GetAssignmentState {
  final MainDataTestsModel data;

  GetProgramsCompleteInitial({required this.data});
}

class GetProgramsLoadingInitial extends GetAssignmentState {}

class LogOutLoadingState extends GetAssignmentState {}

class GetProgramsErrorInitial extends GetAssignmentState {
  final String message;

  GetProgramsErrorInitial({required this.message});

  @override
  List<Object> get props => [message];
}
