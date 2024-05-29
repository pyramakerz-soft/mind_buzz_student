part of 'tracing_cubit.dart';

class TracingInitial extends Equatable {
  final GameModel? gameData;
  List<Offset> offsets = [];

  TracingInitial({this.gameData, required this.offsets});

  TracingInitial copyWith({
    GameModel? gameData,
    List<Offset>? offsets,
  }) {
    return TracingInitial(
        gameData: gameData ?? this.gameData, offsets: offsets ?? this.offsets);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [gameData, offsets];
}
