part of 'tracing_cubit.dart';

class TracingInitial extends Equatable {
  final GameModel? gameData;
  List<Offset> offsets = [];
  List<Offset> finalOffset;
  int? count1;
  int? count2;
  int? count3;

  TracingInitial(
      {this.gameData, required this.offsets, required this.finalOffset, this.count1, this.count2, this.count3});

  TracingInitial copyWith({
    GameModel? gameData,
    List<Offset>? offsets,
    List<Offset>? finalOffset,
    int? count1,
    int? count2,
    int? count3,
  }) {
    return TracingInitial(
        finalOffset: finalOffset ?? this.finalOffset,
        gameData: gameData ?? this.gameData,
        count1: count1 ?? this.count1,
        count2: count2 ?? this.count2,
        count3: count3 ?? this.count3,
        offsets: offsets ?? this.offsets);
  }
  clearData(){
    return TracingInitial(
        finalOffset: [],
        gameData: null,
        count1: null,
        count2: null,
        count3: null,
        offsets: []);
  }
  @override
  // TODO: implement props
  List<Object?> get props => [gameData, offsets, finalOffset,count3, count2, count1];
}
