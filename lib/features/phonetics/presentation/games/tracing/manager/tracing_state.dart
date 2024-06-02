part of 'tracing_cubit.dart';

class TracingInitial extends Equatable {
  final GameModel? gameData;
  final CurrentGamePhoneticsState? stateOfGame;
  List<Color?> colorsOfPaths = [];
  Offset? currentPosition;
  int? countOfPaths;

  TracingInitial(
      {this.gameData,
      required this.colorsOfPaths,
      this.countOfPaths,
      this.currentPosition,
      this.stateOfGame});

  TracingInitial copyWith(
      {GameModel? gameData,
      List<Color?>? colorsOfPaths,
      CurrentGamePhoneticsState? stateOfGame,
      Offset? currentPosition,
      int? countOfPaths}) {
    return TracingInitial(
      gameData: gameData ?? this.gameData,
      stateOfGame: stateOfGame ?? this.stateOfGame,
      colorsOfPaths: colorsOfPaths ?? this.colorsOfPaths,
      currentPosition: currentPosition ?? this.currentPosition,
      countOfPaths: countOfPaths ?? this.countOfPaths,
    );
  }

  clearPosition() {
    return TracingInitial(
      gameData: gameData,
      stateOfGame: stateOfGame,
      colorsOfPaths: colorsOfPaths,
      currentPosition: null,
      countOfPaths: countOfPaths,
    );
  }

  clearData() {
    return TracingInitial(
      gameData: null,
      countOfPaths: null,
      currentPosition: null,
      stateOfGame: null,
      colorsOfPaths: [],
    );
  }

  @override
  List<Object?> get props =>
      [gameData, colorsOfPaths, currentPosition, countOfPaths, stateOfGame];
}
