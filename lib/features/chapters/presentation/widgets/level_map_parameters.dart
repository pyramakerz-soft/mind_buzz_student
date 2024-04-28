import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../domain/entities/image_details.dart';



class LevelMapParams {
  static final _random = math.Random();
  final int levelCount;
  late final double currentLevel;
  final double pathStrokeWidth;
  final Color pathColor;
  final double levelHeight;
  final double dashLengthFactor;
  final bool enableVariationBetweenCurves;
  final double maxVariationFactor;
  late Offset? firstCurveReferencePointOffsetFactor;
  final List<Offset> curveReferenceOffsetVariationForEachLevel;
  final bool showPathShadow;
  final Offset shadowDistanceFromPathOffset;
  final Offset minReferencePositionOffsetFactor;
  final Offset maxReferencePositionOffsetFactor;
  final List<ImageParams> levelsImages;


  // final ImageParams? startLevelImage;
  // final ImageParams completedLevelImage;
  // final ImageParams currentLevelImage;
  // final ImageParams lockedLevelImage;
  // final ImageParams? pathEndImage;
  LevelMapParams({
    required this.levelCount,
    required double currentLevel,
    this.pathColor = Colors.black,
    this.levelHeight = 200,
    this.pathStrokeWidth = 3,
    this.dashLengthFactor = 0.025,
    this.enableVariationBetweenCurves = true,
    this.maxVariationFactor = 0.2,
    this.showPathShadow = true,
    this.shadowDistanceFromPathOffset = const Offset(-2, 12),
    this.minReferencePositionOffsetFactor = const Offset(0.4, 0.3),
    this.maxReferencePositionOffsetFactor = const Offset(1, 0.7),
    this.firstCurveReferencePointOffsetFactor,
    required this.levelsImages,
    // this.startLevelImage,
    // required this.completedLevelImage,
    // required this.currentLevelImage,
    // required this.lockedLevelImage,
    // this.pathEndImage,
  })  : assert(currentLevel <= levelCount,
  "Current level should be less than total level count"),
        assert(currentLevel >= 1, "Current level should at least be 1"),
        assert(dashLengthFactor >= 0 && dashLengthFactor <= 0.5,
        "Dash length factor should be between 0 and 0.5"),
        assert(100 % (dashLengthFactor * 100) == 0,
        "Dash length factor should be a factor of 1"),
        assert(
        minReferencePositionOffsetFactor.dx <= 1 &&
            minReferencePositionOffsetFactor.dx >= 0 &&
            minReferencePositionOffsetFactor.dy <= 1 &&
            minReferencePositionOffsetFactor.dy >= 0,
        "dx and dy of minEndReferenceOffsetVariationFactor should be between 0 and 1"),
        assert(
        maxReferencePositionOffsetFactor.dx <= 1 &&
            maxReferencePositionOffsetFactor.dx >= 0 &&
            maxReferencePositionOffsetFactor.dy <= 1 &&
            maxReferencePositionOffsetFactor.dy >= 0,
        "dx and dy of maxEndReferenceOffsetVariationFactor should be between 0 and 1"),
        this.curveReferenceOffsetVariationForEachLevel = List.generate(
            levelCount,
                (index) => Offset(
                (_random.nextBool()
                    ? _random.nextDouble()
                    : -_random.nextDouble()) *
                    maxVariationFactor,
                (_random.nextBool()
                    ? _random.nextDouble()
                    : -_random.nextDouble()) *
                    maxVariationFactor),
            growable: false) {
    this.currentLevel = currentLevel.clamp(1, levelCount).toDouble();
    this.firstCurveReferencePointOffsetFactor =
        firstCurveReferencePointOffsetFactor ??
            Offset(_random.nextDouble(), _random.nextDouble());
  }
}
