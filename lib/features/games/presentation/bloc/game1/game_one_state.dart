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

  LoadedGame({required this.gameData});

  LoadedGame copyWith(
      {BasedGameModel? gameData,}) {
    return LoadedGame(
        gameData: gameData ?? this.gameData,);
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
