// part of 'curr_cubit.dart';

import 'package:equatable/equatable.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/animation.dart';

class JourneyBarInitial extends Equatable {
  double? totalOfBar = 0;
  Artboard? beeWinningArtboard;
  int currentUnitId;

  JourneyBarInitial(
      {
      this.totalOfBar,
      this.beeWinningArtboard,
      required this.currentUnitId});
  JourneyBarInitial copyWith({
    double? totalOfBar,
    Artboard? beeWinningArtboard,
    int? currentUnitId
  }) {
    return JourneyBarInitial(
        beeWinningArtboard: beeWinningArtboard ?? this.beeWinningArtboard,
        totalOfBar: totalOfBar ?? this.totalOfBar,
      currentUnitId: currentUnitId ?? this.currentUnitId,
    );
  }


  @override
  List<Object?> get props => [
    totalOfBar,
    beeWinningArtboard,
    currentUnitId
      ];
}
