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

