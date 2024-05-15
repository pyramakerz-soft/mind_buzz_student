part of 'drag_out_cubit.dart';

// @immutable
// abstract class DragOutState {}

class DragOutInitial extends Equatable {
  final GameModel gameData;

  DragOutInitial({required this.gameData});
  @override
  List<Object?> get props => [gameData];
}
