part of 'contact_lesson_bloc.dart';

@immutable
abstract class ContactLessonState extends Equatable {
  @override
  List<Object> get props => [];
}
class ContactLessonInitial extends ContactLessonState {}

class GetContactInitial extends ContactLessonState {
  final List<ContactOfLessonModel> data;

  GetContactInitial({required this.data});
}
class GetContactLoadingInitial extends ContactLessonState {}
class LogOutLoadingState extends ContactLessonState {}
class CompleteGameState extends ContactLessonState {}
class GetContactErrorInitial extends ContactLessonState {
  final String message;

  GetContactErrorInitial({required this.message});

  @override
  List<Object> get props => [message];
}