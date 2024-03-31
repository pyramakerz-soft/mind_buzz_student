part of 'lesson_bloc.dart';

@immutable
abstract class LessonEvent extends Equatable {
  @override
  List<Object> get props => [];
}



class GetUnitRequest extends LessonEvent {
  final int programId;

  GetUnitRequest({required this.programId});

  @override
  List<Object> get props => [programId];
}
