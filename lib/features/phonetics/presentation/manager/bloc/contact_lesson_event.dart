part of 'contact_lesson_bloc.dart';


@immutable
abstract class ContactLessonEvent extends Equatable {
  @override
  List<Object> get props => [];
}



class GetContactLessonRequest extends ContactLessonEvent {
  final int programId;
  final int index;

  GetContactLessonRequest({required this.programId,required this.index});

  @override
  List<Object> get props => [programId];
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
