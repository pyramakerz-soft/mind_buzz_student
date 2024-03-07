part of 'game_one_bloc.dart';

@immutable
abstract class GameOneState extends Equatable {
  @override
  List<Object> get props => [];
}

class GameOneInitial extends GameOneState {}

class LoadingGame extends GameOneState {}
class RequestToRestartGame extends GameOneState {

}

class CompleteGame extends GameOneState {
  Artboard? riveArtboardBeeCharacter;
  CompleteGame({this.riveArtboardBeeCharacter});
}

class LoadedGame extends GameOneState {
  late final BasedGameModel gameData;
  final List<GameLettersModel> cardsLetters;

  LoadedGame(
      {required this.cardsLetters,
      required this.gameData});

  LoadedGame copyWith(
      {BasedGameModel? gameData,
      List<GameLettersModel>? cardsLetters,
      int? newCountOfRepeatQuestion}) {
    return LoadedGame(
        gameData: gameData ?? this.gameData,
        cardsLetters: cardsLetters ?? this.cardsLetters);
  }

  handlingDataGame(
      {required BasedGameModel gameData, required LoadedGame state}) {
    state.copyWith(
        cardsLetters: gameData.data?.game?.gameLetters ?? [],
        newCountOfRepeatQuestion: (gameData.data?.game?.numOfTrials ?? 0));
  }

  @override
  List<Object> get props => [gameData,  cardsLetters];
}

class ErrorGame extends GameOneState {
  final String message;

  ErrorGame({required this.message});

  @override
  List<Object> get props => [message];
}
