part of 'chapter_bloc.dart';

@immutable
abstract class ChapterState extends Equatable {
  @override
  List<Object> get props => [];
}
class GetLessonInitial extends ChapterState {}

class GetProgramsHomeInitial extends ChapterState {}
class GetProgramsCompleteInitial extends ChapterState {
  final List<ChapterModel> data;

  GetProgramsCompleteInitial({required this.data});
}
class GetProgramsLoadingInitial extends ChapterState {}
class LogOutLoadingState extends ChapterState {}
class GetProgramsErrorInitial extends ChapterState {
  final String message;

  GetProgramsErrorInitial({required this.message});

  @override
  List<Object> get props => [message];
}
