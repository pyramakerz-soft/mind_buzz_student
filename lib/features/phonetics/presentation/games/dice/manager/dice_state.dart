part of 'dice_cubit.dart';

class DiceInitial extends Equatable {
  final GameModel? gameData;
  String? chooseWord;
  List<int>? correctIndexes;
  bool stopAction = false;

  List<String>? letterDices;
  DiceInitial(
      {this.gameData,
      this.chooseWord,
      this.correctIndexes,
      this.letterDices,
      required this.stopAction});
  DiceInitial copyWith({
    GameModel? gameData,
    String? chooseWord,
    bool? stopAction,
    List<String>? letterDices,
    List<int>? correctIndexes,
  }) {
    return DiceInitial(
        gameData: gameData ?? this.gameData,
        chooseWord: chooseWord ?? this.chooseWord,
        stopAction: stopAction ?? this.stopAction,
        letterDices: letterDices ?? this.letterDices,
        correctIndexes: correctIndexes ?? this.correctIndexes);
  }

  clearCurrentAnswer() {
    return DiceInitial(
        gameData: gameData ?? gameData,
        chooseWord: null,
        stopAction: stopAction ?? stopAction,
        letterDices: letterDices ?? letterDices,
        correctIndexes: correctIndexes ?? correctIndexes);
  }

  @override
  List<Object?> get props =>
      [gameData, chooseWord, correctIndexes, letterDices, stopAction];
}
