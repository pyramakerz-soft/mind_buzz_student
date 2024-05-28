part of 'x_out_cubit.dart';

@immutable
class XOutInitial extends Equatable {
  final List<GameModel>? gameData;
  final int? correctAnswers;
  final int? currentGameIndex;
  final List<int>? selectedItems;
  final bool isInteracting;

  XOutInitial({
    this.gameData,
    this.correctAnswers = 0,
    this.currentGameIndex = 0,
    this.selectedItems = const [],
    this.isInteracting = false,
  });

  XOutInitial copyWith({
    List<GameModel>? gameData,
    int? correctAnswers,
    int? currentGameIndex,
    List<int>? selectedItems,
        bool? isInteracting,

  }) {
    return XOutInitial(
      gameData: gameData ?? this.gameData,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      currentGameIndex: currentGameIndex ?? this.currentGameIndex,
      selectedItems: selectedItems ?? this.selectedItems,
      isInteracting: isInteracting ?? this.isInteracting,

    );
  }

  @override
  List<Object?> get props => [gameData, correctAnswers, selectedItems,currentGameIndex,isInteracting];
}
