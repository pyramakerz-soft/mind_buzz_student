part of 'tracing_cubit.dart';

class TracingInitial extends Equatable {
  final GameModel? gameData;
  List<Offset> offsets = [];
  List<Offset> finalOffset;

  TracingInitial(
      {this.gameData, required this.offsets, required this.finalOffset});

  TracingInitial copyWith({
    GameModel? gameData,
    List<Offset>? offsets,
    List<Offset>? finalOffset,
  }) {
    return TracingInitial(
        finalOffset: finalOffset ?? this.finalOffset,
        gameData: gameData ?? this.gameData,
        offsets: offsets ?? this.offsets);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [gameData, offsets, finalOffset];
}
