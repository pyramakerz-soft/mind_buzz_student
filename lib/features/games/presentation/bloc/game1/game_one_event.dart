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

