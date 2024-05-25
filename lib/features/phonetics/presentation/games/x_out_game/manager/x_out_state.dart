part of 'x_out_cubit.dart';

@immutable
class XOutInitial extends Equatable {
  final GameModel? gameData;
  final int? correctAnswers;
  final List<int>? selectedItems;

  XOutInitial({
    this.gameData,
    this.correctAnswers = 0,
    this.selectedItems = const [],
  });

  XOutInitial copyWith({
    GameModel? gameData,
    int? correctAnswers,
    List<int>? selectedItems,
  }) {
    return XOutInitial(
      gameData: gameData ?? this.gameData,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      selectedItems: selectedItems ?? this.selectedItems,
    );
  }

  @override
  List<Object?> get props => [gameData, correctAnswers, selectedItems];
}
