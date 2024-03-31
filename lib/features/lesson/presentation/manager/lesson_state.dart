part of 'lesson_bloc.dart';

@immutable
abstract class LessonState extends Equatable {
  @override
  List<Object> get props => [];
}
class GetLessonInitial extends LessonState {}

class GetProgramsHomeInitial extends LessonState {}
class GetProgramsCompleteInitial extends LessonState {
  final List<LessonModel> data;

  GetProgramsCompleteInitial({required this.data});
}
class GetProgramsLoadingInitial extends LessonState {}
class LogOutLoadingState extends LessonState {}
class GetProgramsErrorInitial extends LessonState {
  final String message;

  GetProgramsErrorInitial({required this.message});

  @override
  List<Object> get props => [message];
}
