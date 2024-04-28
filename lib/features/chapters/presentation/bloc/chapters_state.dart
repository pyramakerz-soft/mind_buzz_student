part of 'chapters_bloc.dart';

@immutable
abstract class ChaptersState extends Equatable {
  @override
  List<Object> get props => [];
}

class ChaptersInitialState extends ChaptersState {}

class ChaptersLoadingState extends ChaptersState {}

class ChaptersSuccessState extends ChaptersState {

}
