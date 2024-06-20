// ignore_for_file: public_member_api_docs, sort_constructors_first
// part of 'curr_cubit.dart';

import 'package:dartz/dartz.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/foundation.dart';
import 'package:mind_buzz_refactor/features/unit/domain/entities/unit_model.dart';

import 'package:games_models/games_models.dart';

class JourneyBarState {
  double? totalOfBar = 0;
  Artboard? beeWinningArtboard;
  int currentUnitId;
  List<ChapterModel>? dataOfLessons;
  List<UnitModel> units;
  int currentUnitIndex;

  JourneyBarState(
      {this.totalOfBar,
      this.beeWinningArtboard,
      required this.currentUnitId,
      this.dataOfLessons,
      required this.currentUnitIndex,
      required this.units});
  JourneyBarState copyWith({
    double? totalOfBar,
    Artboard? beeWinningArtboard,
    int? currentUnitId,
    List<UnitModel>? units,
    List<ChapterModel>? dataOfLessons,
    int? currentUnitIndex,
  }) {
    return JourneyBarState(
      beeWinningArtboard: beeWinningArtboard ?? this.beeWinningArtboard,
      totalOfBar: totalOfBar ?? this.totalOfBar,
      units: units ?? this.units,
      currentUnitId: currentUnitId ?? this.currentUnitId,
      dataOfLessons: dataOfLessons ?? this.dataOfLessons,
      currentUnitIndex: currentUnitIndex ?? this.currentUnitIndex,
    );
  }

  List<Object?> get props => [
        totalOfBar,
        beeWinningArtboard,
        currentUnitId,
        dataOfLessons,
        currentUnitIndex,
      ];

  @override
  bool operator ==(covariant JourneyBarState other) {
    if (identical(this, other)) return true;

    return other.totalOfBar == totalOfBar &&
        other.beeWinningArtboard == beeWinningArtboard &&
        other.currentUnitId == currentUnitId &&
        listEquals(other.dataOfLessons, dataOfLessons) &&
        other.currentUnitIndex == currentUnitIndex;
  }

  @override
  int get hashCode {
    return totalOfBar.hashCode ^
        beeWinningArtboard.hashCode ^
        currentUnitId.hashCode ^
        dataOfLessons.hashCode ^
        currentUnitIndex.hashCode;
  }
}
