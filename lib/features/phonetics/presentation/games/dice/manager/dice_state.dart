part of 'dice_cubit.dart';

class DiceInitial extends Equatable {
  final GameModel? gameData;
  String? chooseWord;
  List<int>? correctIndexes;
  List<String>? letterDices;
  DiceInitial(
      {this.gameData, this.chooseWord, this.correctIndexes, this.letterDices});
  DiceInitial copyWith({
    GameModel? gameData,
    String? chooseWord,
    List<String>? letterDices,
    List<int>? correctIndexes,
  }) {
    return DiceInitial(
        gameData: gameData ?? this.gameData,
        chooseWord: chooseWord ?? this.chooseWord,
        letterDices: letterDices ?? this.letterDices,
        correctIndexes: correctIndexes ?? this.correctIndexes);
  }

  @override
  List<Object?> get props =>
      [gameData, chooseWord, correctIndexes, letterDices];
}
