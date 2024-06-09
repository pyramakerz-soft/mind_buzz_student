part of 'get_programs_home_bloc.dart';

@immutable
abstract class GetProgramsHomeState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetProgramsHomeInitial extends GetProgramsHomeState {}

class GetProgramsCompleteInitial extends GetProgramsHomeState {
  final List<UserCourseModel> data;
  final bool isHaveAssignments;
  GetProgramsCompleteInitial(
      {required this.data, required this.isHaveAssignments});
}

class GetProgramsLoadingInitial extends GetProgramsHomeState {}

class LogOutLoadingState extends GetProgramsHomeState {}

class GetProgramsErrorInitial extends GetProgramsHomeState {
  final String message;

  GetProgramsErrorInitial({required this.message});

  @override
  List<Object> get props => [message];
}
