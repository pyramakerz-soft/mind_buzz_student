// part of 'curr_cubit.dart';

import 'package:equatable/equatable.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/animation.dart';

class JourneyBarInitial extends Equatable {
  double? totalOfBar = 0;
  Artboard? beeWinningArtboard;

  JourneyBarInitial(
      {
      this.totalOfBar,
      this.beeWinningArtboard,});
  JourneyBarInitial copyWith({
    double? totalOfBar,
    Artboard? beeWinningArtboard
  }) {
    return JourneyBarInitial(
        beeWinningArtboard: beeWinningArtboard ?? this.beeWinningArtboard,
        totalOfBar: totalOfBar ?? this.totalOfBar);
  }


  @override
  List<Object?> get props => [
    totalOfBar,
    beeWinningArtboard
      ];
}
