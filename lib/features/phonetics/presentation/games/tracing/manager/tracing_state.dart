part of 'tracing_cubit.dart';

class TracingInitial extends Equatable {
  final GameModel? gameData;
  final CurrentGamePhoneticsState? stateOfGame;
  List<Offset> offsets = [];
  List<Color> colorsOfPaths = [];
  List<Offset> finalOffset;
  int? count1;
  int? count2;
  int? countOfPaths;
  int? count3;

  TracingInitial(
      {this.gameData,
      required this.offsets,
      required this.finalOffset,
      this.count1,
      this.count2,
      this.count3,
      required this.colorsOfPaths,
      this.countOfPaths,
      this.stateOfGame});

  TracingInitial copyWith({
    GameModel? gameData,
    List<Offset>? offsets,
    List<Offset>? finalOffset,
    List<Color>? colorsOfPaths,
    int? count1,
    CurrentGamePhoneticsState? stateOfGame,
    int? countOfPaths,
    int? count2,
    int? count3,
  }) {
    return TracingInitial(
        finalOffset: finalOffset ?? this.finalOffset,
        gameData: gameData ?? this.gameData,
        stateOfGame: stateOfGame ?? this.stateOfGame,
        colorsOfPaths: colorsOfPaths ?? this.colorsOfPaths,
        count1: count1 ?? this.count1,
        countOfPaths: countOfPaths ?? this.countOfPaths,
        count2: count2 ?? this.count2,
        count3: count3 ?? this.count3,
        offsets: offsets ?? this.offsets);
  }

  clearData() {
    return TracingInitial(
        finalOffset: [],
        gameData: null,
        count1: null,
        countOfPaths: null,
        stateOfGame: null,
        colorsOfPaths: [],
        count2: null,
        count3: null,
        offsets: []);
  }

  @override
  List<Object?> get props => [
        gameData,
        offsets,
        finalOffset,
    colorsOfPaths,
        count3,
        count2,
        count1,
        countOfPaths,
        stateOfGame
      ];
}
