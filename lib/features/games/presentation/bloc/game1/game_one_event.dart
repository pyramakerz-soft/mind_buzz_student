part of 'game_one_bloc.dart';

@immutable
abstract class GameOneEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetGameData extends GameOneEvent {
  final bool showOffline;

  GetGameData({required this.showOffline});

  @override
  List<Object> get props => [showOffline];
}

class CompleteGameData extends GameOneEvent {


  @override
  List<Object> get props => [];
}


class RestartGameData extends GameOneEvent {
  final bool showOffline;

  RestartGameData({required this.showOffline});


  @override
  List<Object> get props => [showOffline];
}

class RequestToRestartGameData extends GameOneEvent {

  RequestToRestartGameData();


  @override
  List<Object> get props => [];
}


class SubmitNewAnswerData extends GameOneEvent {
  final int index;
  final List<GameLettersModel> cardsLetters;
  final BasedGameModel gameData;
  SubmitNewAnswerData({required this.gameData, required this.index, required this.cardsLetters});


  @override
  List<Object> get props => [index, cardsLetters, gameData];
}


