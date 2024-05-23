part of 'drag_out_cubit.dart';

// @immutable
// abstract class DragOutState {}

class DragOutInitial extends Equatable {
  final List<GameModel> gameData;
  int? correctAnswer;
  int? index;

  DragOutInitial({required this.gameData, this.correctAnswer, this.index});
  DragOutInitial copyWith(
      {List<GameModel>? gameData,
        int? correctAnswer,
        int? index,
      }) {
    print('correctAnswer:$correctAnswer');
    return DragOutInitial(
        gameData: gameData ?? this.gameData,
        index: index ?? this.index,
        correctAnswer: correctAnswer ?? this.correctAnswer);
  }

  @override
  List<Object?> get props => [gameData, correctAnswer, index];
}
