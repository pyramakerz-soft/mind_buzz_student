part of 'bingo_cubit.dart';

@immutable

class BingoInitial extends Equatable {
  List<String>? indexOfCorrectAnswers;
  List<GameLettersModel>? cardsLetters;
  GameModel? gameData;
  BingoInitial({this.gameData, this.indexOfCorrectAnswers, this.cardsLetters});

  BingoInitial copyWith(
      {GameModel? gameData,
        List<GameLettersModel>? cardsLetters,
        List<String>? indexOfCorrectAnswers}) {
    return BingoInitial(
        gameData: gameData ?? this.gameData,
        cardsLetters: cardsLetters ?? this.cardsLetters,
        indexOfCorrectAnswers: indexOfCorrectAnswers ?? this.indexOfCorrectAnswers);
  }
  @override
  List<Object?> get props => [gameData, indexOfCorrectAnswers, cardsLetters];
}
