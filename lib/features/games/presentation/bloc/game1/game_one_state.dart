part of 'game_one_bloc.dart';

@immutable
abstract class GameOneState extends Equatable {
  @override
  List<Object> get props => [];
}

class GameOneInitial extends GameOneState {}

class LoadingGame extends GameOneState {}

class LoadedGame extends GameOneState {
  final BasedGameModel gameData;
  final List<GameLettersModel>? cardsLetters;
  final int? newCountOfRepeatQuestion;

  LoadedGame(
      {this.cardsLetters,
      required this.gameData,
      this.newCountOfRepeatQuestion});

  LoadedGame copyWith(
      {BasedGameModel? gameData,
      List<GameLettersModel>? cardsLetters,
      int? newCountOfRepeatQuestion}) {
    return LoadedGame(
        gameData: gameData ?? this.gameData,
        newCountOfRepeatQuestion:
            newCountOfRepeatQuestion ?? this.newCountOfRepeatQuestion,
        cardsLetters: cardsLetters ?? this.cardsLetters);
  }

  @override
  List<Object> get props => [gameData];
}

class ErrorGame extends GameOneState {
  final String message;

  ErrorGame({required this.message});

  @override
  List<Object> get props => [message];
}
