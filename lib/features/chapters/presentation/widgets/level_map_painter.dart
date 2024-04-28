import 'dart:ui' as ui;

import 'package:flame/extensions.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:mind_buzz_refactor/features/chapters/domain/entities/image_details.dart';
import 'package:mind_buzz_refactor/features/chapters/presentation/widgets/level_map_parameters.dart';

import '../../domain/entities/images_to_paint.dart';

class LevelMapPainter extends CustomPainter {
  final LevelMapParams params;
  final ImagesToPaint? imagesToPaint;
  final Paint _pathPaint;
  final Paint _shadowPaint;


  /// Describes the fraction to reach next level.
  /// If the [LevelMapParams.currentLevel] is 6.5, [_nextLevelFraction] is 0.5.
  final double _nextLevelFraction;

  LevelMapPainter({required this.params, this.imagesToPaint})
      : _pathPaint = Paint()
          ..strokeWidth = params.pathStrokeWidth
          ..color = params.pathColor
          ..strokeCap = StrokeCap.round,
        _shadowPaint = Paint()
          ..strokeWidth = params.pathStrokeWidth
          ..color = params.pathColor.withOpacity(0.2)
          ..strokeCap = StrokeCap.round,
        _nextLevelFraction =
            params.currentLevel.remainder(params.currentLevel.floor());

  @override
  void paint(Canvas canvas, Size size) {

    canvas.save();

    canvas.translate(0, size.height);

    // if (imagesToPaint != null) {
    //   _drawBGImages(canvas);
    //    // _drawStartLevelImage(canvas, size.width);
    //   // _drawPathEndImage(canvas, size.width, size.height);
    // }

    final double _centerWidth = size.width / 2;
    double _p2_dx_VariationFactor =
        params.firstCurveReferencePointOffsetFactor!.dx;
    double _p2_dy_VariationFactor =
        params.firstCurveReferencePointOffsetFactor!.dy;
    List<Offset> offsets = [];
    for (int thisLevel = 0; thisLevel < params.levelCount; thisLevel++) {
      List<ImageDetails> imageDetails = imagesToPaint!.bgImages;
      final Offset p1 = Offset(_centerWidth, -(thisLevel * params.levelHeight));
      final Offset p2 = getP2OffsetBasedOnCurveSide(thisLevel,
          _p2_dx_VariationFactor, _p2_dy_VariationFactor, _centerWidth);
      final Offset p3 = Offset(_centerWidth,
          -((thisLevel * params.levelHeight) + params.levelHeight));
      Offset currentLevelOffset = Offset(thisLevel % 2 != 0 ? p1.dx * 1.3 : p1.dx / 1.3,
          thisLevel == imageDetails.length - 1 ? p1.dy - 110 : p1.dy)
          .toBottomCenter(imageDetails[thisLevel].size);

      _drawBezierCurve(
          canvas,
          ui.Offset(p1.dx, thisLevel == 0 ? p1.dy - 30 : p1.dy),
          p2,
          ui.Offset(
              p3.dx, thisLevel == imageDetails.length - 1 ? p3.dy + 45 : p3.dy),
          thisLevel + 1);


      ////////////////// paint image //////////////////////////

      // _paintImage(canvas, imageDetails[thisLevel],currentLevelOffset);
      // offsets.add(currentLevelOffset);

      if (params.enableVariationBetweenCurves) {
        _p2_dx_VariationFactor = _p2_dx_VariationFactor +
            params.curveReferenceOffsetVariationForEachLevel[thisLevel].dx;
        _p2_dy_VariationFactor = _p2_dy_VariationFactor +
            params.curveReferenceOffsetVariationForEachLevel[thisLevel].dy;
      }
    }


    canvas.restore();

  }
  //
  // void _drawBGImages(Canvas canvas) {
  //   final List<ImageDetails> _bgImages = imagesToPaint!.bgImages;
  //   if (_bgImages != null) {
  //     _bgImages.forEach((bgImage) {
  //       bgImage.offsetsToBePainted.forEach((offset) {
  //         _paintImage(canvas, bgImage.imageDetails, offset);
  //       });
  //     });
  //   }
  // }

  // void _drawStartLevelImage(Canvas canvas, double canvasWidth) {
  //   if (imagesToPaint!.startLevelImage != null) {
  //     final ImageDetails _startLevelImage = imagesToPaint!.startLevelImage!;
  //     final Offset _offset =
  //     Offset(canvasWidth / 2, 0).toBottomCenter(_startLevelImage.size);
  //     _paintImage(canvas, _startLevelImage, _offset);
  //   }
  // }
  //
  // void _drawPathEndImage(
  //     Canvas canvas, double canvasWidth, double canvasHeight) {
  //   if (imagesToPaint!.pathEndImage != null) {
  //     final ImageDetails _pathEndImage = imagesToPaint!.pathEndImage!;
  //     final Offset _offset = Offset(canvasWidth / 2, -canvasHeight)
  //         .toTopCenter(_pathEndImage.size.width);
  //     _paintImage(canvas, _pathEndImage, _offset);
  //   }
  // }

  Offset getP2OffsetBasedOnCurveSide(
      int thisLevel,
      double p2_dx_VariationFactor,
      double p2_dy_VariationFactor,
      double centerWidth) {
    final double clamped_dxFactor = p2_dx_VariationFactor.clamp(
        params.minReferencePositionOffsetFactor.dx,
        params.maxReferencePositionOffsetFactor.dx);
    final double clamped_dyFactor = p2_dy_VariationFactor.clamp(
        params.minReferencePositionOffsetFactor.dy,
        params.maxReferencePositionOffsetFactor.dy);
    final double p2_dx = thisLevel.isEven
        ? centerWidth * (1 - clamped_dxFactor)
        : centerWidth + (centerWidth * clamped_dxFactor);
    final double p2_dy = -((thisLevel * params.levelHeight) +
        (params.levelHeight *
            (thisLevel.isEven ? clamped_dyFactor : 1 - clamped_dyFactor)));
    return Offset(p2_dx, p2_dy);
  }

  void _drawBezierCurve(
      Canvas canvas, Offset p1, Offset p2, Offset p3, int thisLevel ) {

    final double _dashFactor = params.dashLengthFactor;
    //TODO: Customise the empty dash length with this multiplication factor 2.
    for (double t = _dashFactor; t <= 1; t += _dashFactor * 2) {
      Offset offset1 = Offset(
          _compute(t, p1.dx, p2.dx, p3.dx), _compute(t, p1.dy, p2.dy, p3.dy));
      Offset offset2 = Offset(_compute(t + _dashFactor, p1.dx, p2.dx, p3.dx),
          _compute(t + _dashFactor, p1.dy, p2.dy, p3.dy));

      canvas.drawLine(offset1, offset2, _pathPaint);
      if (params.showPathShadow) {
        canvas.drawLine(
            Offset(offset1.dx + params.shadowDistanceFromPathOffset.dx,
                offset1.dy + params.shadowDistanceFromPathOffset.dy),
            Offset(offset2.dx + params.shadowDistanceFromPathOffset.dx,
                offset2.dy + params.shadowDistanceFromPathOffset.dy),
            _shadowPaint);
      }
    }
    if (imagesToPaint != null) {
      final Offset _offsetToPaintImage = Offset(
          _compute(0.5, p1.dx, p2.dx, p3.dx),
          _compute(0.5, p1.dy, p2.dy, p3.dy));
      // List<ImageDetails> imageDetails = imagesToPaint!.bgImages;

      // if (params.currentLevel >= thisLevel) {
      //   imageDetails = imagesToPaint!.completedLevelImage;
      // }
      // else {
      //   imageDetails = imagesToPaint!.lockedLevelImage;
      // }

      final double _curveFraction;
      final int _flooredCurrentLevel = params.currentLevel.floor();
      if (_flooredCurrentLevel == thisLevel && _nextLevelFraction <= 0.5) {
        _curveFraction = 0.5 + _nextLevelFraction;
        // _paintImage(canvas, imagesToPaint!.currentLevelImage,
        // _offsetToPaintImage.toCenter(imageDetails.size));
      } else if (_flooredCurrentLevel == thisLevel - 1 &&
          _nextLevelFraction > 0.5) {
        _curveFraction = _nextLevelFraction - 0.5;
      } else {
        return;
      }
      final Offset _offsetToPaintCurrentLevelImage = Offset(
          _compute(_curveFraction, p1.dx, p2.dx, p3.dx),
          _compute(_curveFraction, p1.dy, p2.dy, p3.dy));
      // for(ImageDetails img in imageDetails){
      //   _paintImage(canvas, img, _offsetToPaintImage.toBottomCenter(img.size));
      // }
      // _paintImage(canvas, imagesToPaint!.currentLevelImage,
      //     _offsetToPaintCurrentLevelImage.toBottomCenter(imageDetails.size));
    }
  }

  void _paintImage(Canvas canvas, ImageDetails imageDetails, Offset offset) {
    paintImage(
        canvas: canvas,
        rect: Rect.fromLTWH(offset.dx, offset.dy, imageDetails.size.width,
            imageDetails.size.height),
        image: imageDetails.imageInfo.image);
  }

  double _compute(double t, double p1, double p2, double p3) {
    ///To learn about these parameters, visit https://en.wikipedia.org/wiki/B%C3%A9zier_curve
    return (((1 - t) * (1 - t) * p1) + (2 * (1 - t) * t * p2) + (t * t) * p3);
  }

  @override
  bool shouldRepaint(covariant LevelMapPainter oldDelegate) =>
      oldDelegate.imagesToPaint != imagesToPaint;
}

// class BGImage {
//   final ImageDetails imageDetails;
//   final List<ui.Offset> offsetsToBePainted;
//
//   BGImage({required this.imageDetails, required this.offsetsToBePainted});
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//           other is BGImage &&
//               runtimeType == other.runtimeType &&
//               imageDetails == other.imageDetails &&
//               offsetsToBePainted == other.offsetsToBePainted;
//
//   @override
//   int get hashCode => imageDetails.hashCode ^ offsetsToBePainted.hashCode;
// }
extension ImageOffsetExtension on Offset {
  Offset clamp(Size imageSize, Size canvasSize) {
    double dx = this.dx;
    if (dx + imageSize.width > canvasSize.width) {
      dx = dx - imageSize.width;
    }
    double dy = this.dy;
    if (-dy < imageSize.height) {
      dy = -imageSize.height.toDouble();
    } else if (-dy > canvasSize.height) {
      dy = -canvasSize.height;
    }
    return Offset(dx, dy);
  }

  Offset toCenter(Size imageSize) {
    return Offset(
        this.dx - (imageSize.width / 2), this.dy - (imageSize.height / 2));
  }

  Offset toBottomCenter(Size imageSize) {
    return Offset(this.dx - (imageSize.width / 2), this.dy - imageSize.height);
  }

  Offset toTopCenter(double imageWidth) {
    return Offset(this.dx - (imageWidth / 2), this.dy);
  }
}
