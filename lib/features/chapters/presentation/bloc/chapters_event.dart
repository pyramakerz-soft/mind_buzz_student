part of 'chapters_bloc.dart';

@immutable
abstract class ChaptersEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChapterOffsetsEvent extends ChaptersEvent{}

