part of 'click_the_sound_cubit.dart';

class ClickTheSoundInitial extends Equatable {
  final GameModel gameData;
  List<String>? letters;
  int? correctAnswers = 0;
  List<int>? correctIndexes = [];
  final bool isInteracting;
  int? selectedItem;

  ClickTheSoundInitial({
    required this.gameData,
    this.letters,
    this.correctAnswers,
    this.correctIndexes,
    this.isInteracting = false,
    this.selectedItem,
  });

  ClickTheSoundInitial copyWith({
    GameModel? gameData,
    List<String>? letters,
    int? correctAnswers,
    List<int>? correctIndexes,
    bool? isInteracting,
    int? selectedItem,
  }) {
    return ClickTheSoundInitial(
      gameData: gameData ?? this.gameData,
      letters: letters ?? this.letters,
      correctAnswers: correctAnswers ?? this.correctAnswers,
      correctIndexes: correctIndexes ?? this.correctIndexes,
      isInteracting: isInteracting ?? this.isInteracting,
      selectedItem: selectedItem ?? this.selectedItem,
    );
  }

  @override
  List<Object?> get props => [gameData, letters, correctAnswers, correctIndexes, isInteracting, selectedItem];
}
