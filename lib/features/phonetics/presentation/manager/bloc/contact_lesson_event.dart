part of 'contact_lesson_bloc.dart';


@immutable
abstract class ContactLessonEvent extends Equatable {
  @override
  List<Object> get props => [];
}



class GetContactLessonRequest extends ContactLessonEvent {
  final int lessonId;
  final int gameId;

  GetContactLessonRequest({required this.lessonId,required this.gameId});

  @override
  List<Object> get props => [lessonId];
}
class GetGameRequest extends ContactLessonEvent {
  final int gameId;

  GetGameRequest({required this.gameId});

  @override
  List<Object> get props => [gameId];
}



class CompleteLessonRequest extends ContactLessonEvent {
  CompleteLessonRequest();
  @override
  List<Object> get props => [];
}
class ThisTypeNotSupportedRequest extends ContactLessonEvent {
  ThisTypeNotSupportedRequest();
  @override
  List<Object> get props => [];
}
