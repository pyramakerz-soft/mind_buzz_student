part of 'chapter_bloc.dart';

@immutable
abstract class ChapterEvent extends Equatable {
  @override
  List<Object> get props => [];
}



class GetUnitRequest extends ChapterEvent {
  final int programId;

  GetUnitRequest({required this.programId});

  @override
  List<Object> get props => [programId];
}
