// part of 'curr_cubit.dart';

import 'package:equatable/equatable.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/animation.dart';

import '../../domain/entities/chapter_model.dart';
import '../../domain/entities/lesson_model.dart';

class JourneyBarInitial extends Equatable {
  double? totalOfBar = 0;
  Artboard? beeWinningArtboard;
  int currentUnitId;
  List<ChapterModel>? dataOfLessons;

  JourneyBarInitial(
      {this.totalOfBar,
      this.beeWinningArtboard,
      required this.currentUnitId,
      this.dataOfLessons});
  JourneyBarInitial copyWith(
      {double? totalOfBar,
      Artboard? beeWinningArtboard,
      int? currentUnitId,
      List<ChapterModel>? dataOfLessons}) {
    return JourneyBarInitial(
        beeWinningArtboard: beeWinningArtboard ?? this.beeWinningArtboard,
        totalOfBar: totalOfBar ?? this.totalOfBar,
        currentUnitId: currentUnitId ?? this.currentUnitId,
        dataOfLessons: dataOfLessons ?? this.dataOfLessons);
  }

  @override
  List<Object?> get props =>
      [totalOfBar, beeWinningArtboard, currentUnitId, dataOfLessons];
}
