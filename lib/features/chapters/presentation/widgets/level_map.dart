import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mind_buzz_refactor/core/vars.dart';

import 'package:mind_buzz_refactor/features/chapters/presentation/widgets/level_map_painter.dart';
import 'package:mind_buzz_refactor/features/chapters/presentation/widgets/level_map_parameters.dart';
import 'package:games_models/games_models.dart';

enum Side {
  LEFT,
  RIGHT,
  BOTH,
}

class LevelMap extends StatelessWidget {
  final LevelMapParams levelMapParams;
  final Color backgroundColor;
  final Function(int) onTapLevel;

  /// If set to false, scroll starts from the bottom end (level 1).
  final bool scrollToCurrentLevel;
  LevelMap({
    Key? key,
    required this.levelMapParams,
    required this.onTapLevel,
    this.backgroundColor = Colors.transparent,
    this.scrollToCurrentLevel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => ScrollConfiguration(
        behavior: const MyBehavior(),
        child: SingleChildScrollView(
          controller: ScrollController(
              initialScrollOffset: ((( levelMapParams.levelCount)) *
                      levelMapParams.levelHeight) -
                  constraints.maxHeight),
          // physics: FixedExtentScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.only(left: 0.3.sw,right: 10, top: 0.1.sh,bottom: 20),
            child: ColoredBox(
              color: backgroundColor,
              child: FutureBuilder<ImagesToPaint?>(
                future: loadImagesToPaint(
                  levelMapParams,
                  levelMapParams.levelCount,
                  levelMapParams.levelHeight,
                  constraints.maxWidth,
                ),
                builder: (context, snapshot) {
                  return Stack(
                    children: [
                      CustomPaint(
                        size: Size(
                            constraints.maxWidth*0.9,
                            levelMapParams.levelCount< 15?
                            (levelMapParams.levelCount *
                                levelMapParams.levelHeight) + 50 :
                           levelMapParams.levelCount *
                                levelMapParams.levelHeight),
                        painter: LevelMapPainter(
                            params: levelMapParams, imagesToPaint: snapshot.data),
                      ),
                      ...List.generate(
                          levelMapParams.levelsImages.length,
                          (index) => Positioned(
                              left: index == levelMapParams.levelsImages.length - 1 || index== 0?
                              constraints.maxWidth * 0.1  + 20:
                              index % 2 != 0
                                  ? constraints.maxWidth * 0.06
                                  : constraints.maxWidth / 3.7,
                              top: index == levelMapParams.levelsImages.length - 1
                                  ? (index * (levelMapParams.levelHeight)) + 120
                                  : index * (levelMapParams.levelHeight),
                              child: InkWell(
                                  onTap: () {
                                    onTapLevel.call(index);
                                  },
                                  child:
                                  Column(
                                    children: [

                                      Stack(
                                        alignment: Alignment.center,

                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: Image.asset(
                                              levelMapParams.levelsImages[index].path ??
                                                  '',
                                              height: levelMapParams.levelsImages[index].size.height,
                                              width: 125,
                                              fit: BoxFit.fill,
                                            ),
                                          ),

                                          if(levelMapParams.levelsImages[index].bodyWidget != null)...{
                                            Column(
                                              children: [
                                                10.ph,
                                                levelMapParams
                                                    .levelsImages[index].bodyWidget??const SizedBox(),
                                                10.ph
                                              ],
                                            ),


                                            Positioned(
                                                top:-2,
                                                child: levelMapParams.levelsImages[index].title??const SizedBox(height: 20,)),
                                          }
                                        ],
                                      ),
                                    ],
                                  ),
                                      ))),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  final math.Random _random = math.Random();

  Future<ImagesToPaint?> loadImagesToPaint(LevelMapParams levelMapParams,
      int levelCount, double levelHeight, double screenWidth) async {
    // final ImageDetails completedLevelImageDetails = ImageDetails(
    //     imageInfo: await _getUiImage(levelMapParams.completedLevelImage),
    //     size: levelMapParams.completedLevelImage.size);
    // final ImageDetails currentLevelImageDetails = ImageDetails(
    //     imageInfo: await _getUiImage(levelMapParams.currentLevelImage),
    //     size: levelMapParams.currentLevelImage.size);
    // final ImageDetails lockedLevelImageDetails = ImageDetails(
    //     imageInfo: await _getUiImage(levelMapParams.lockedLevelImage ),
    //     size: levelMapParams.lockedLevelImage.size);
    // final ImageDetails? startLevelImageDetails =
    // levelMapParams.startLevelImage != null
    //     ? ImageDetails(
    //     imageInfo: await _getUiImage(levelMapParams.startLevelImage!),
    //     size: levelMapParams.startLevelImage!.size)
    //     : null;
    // final ImageDetails? pathEndImageDetails = levelMapParams.pathEndImage != null
    //     ? ImageDetails(
    //     imageInfo: await _getUiImage(levelMapParams.pathEndImage!),
    //     size: levelMapParams.pathEndImage!.size)
    //     : null;
    final List<ImageDetails>? bgImageDetailsList = await _getBGImages(
        levelMapParams.levelsImages.cast<ImageParams>(),
        levelCount,
        levelHeight,
        screenWidth);
    return ImagesToPaint(
      bgImages: bgImageDetailsList!,
      // startLevelImage: startLevelImageDetails,
      // completedLevelImage: completedLevelImageDetails,
      // currentLevelImage: currentLevelImageDetails,
      // lockedLevelImage: lockedLevelImageDetails,
      // pathEndImage: pathEndImageDetails,
    );
  }

  Future<List<ImageDetails>?> _getBGImages(List<ImageParams> bgImagesParams,
      int levelCount, double levelHeight, double screenWidth) async {
    if (bgImagesParams.isNotEmpty) {
      final List<ImageDetails> _bgImagesToPaint = [];
      await Future.forEach<ImageParams>(bgImagesParams, (bgImageParam) async {
        final ImageInfo? imageInfo = await _getUiImage(bgImageParam);
        if (imageInfo == null || bgImageParam.repeatCountPerLevel == 0) {
          return;
        }
        // final List<ui.Offset> offsetList =
        // _getImageOffsets(bgImageParam, levelCount, levelHeight, screenWidth);
        _bgImagesToPaint
            .add(ImageDetails(imageInfo: imageInfo, size: bgImageParam.size));
      });
      return _bgImagesToPaint;
    }
  }

  List<ui.Offset> _getImageOffsets(ImageParams imageParams, int levelCount,
      double levelHeight, double screenWidth) {
    final List<ui.Offset> offsetList = [];
    final int imageRepeatCount =
        (levelCount * imageParams.repeatCountPerLevel).ceil();
    final double heightBasedOnRepeatCount =
        (1 / imageParams.repeatCountPerLevel) * levelHeight;

    for (int i = 1; i <= imageRepeatCount; i++) {
      double dx = 0;
      double _widthPerSide = screenWidth / 2;
      if (imageParams.side == Side.RIGHT ||
          (imageParams.side == Side.BOTH && _random.nextBool())) {
        dx = imageParams.imagePositionFactor *
            _widthPerSide *
            _random.nextDouble();
        dx = screenWidth - dx;
      } else {
        dx = imageParams.imagePositionFactor *
            _widthPerSide *
            _random.nextDouble();
      }
      final double dy = -(((i - 1) * heightBasedOnRepeatCount) +
          (heightBasedOnRepeatCount * _random.nextDouble()));
      offsetList.add(ui.Offset(dx, dy).clamp(
        imageParams.size,
        Size(screenWidth, levelCount * levelHeight),
      ));
    }
    return offsetList;
  }

  Future<ImageInfo> _getUiImage(ImageParams imageParams) async {
    Completer<ImageInfo> completer = Completer();
    //TODO: Add network image functionality also.
    final AssetImage image = new AssetImage(imageParams.path);
    image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) {
      completer.complete(info);
    }));
    ImageInfo imageInfo = await completer.future;
    return imageInfo;
  }
}

class MyBehavior extends ScrollBehavior {
  const MyBehavior();
  @override
  Widget buildViewportChrome(
    BuildContext context,
    Widget child,
    AxisDirection axisDirection,
  ) {
    return child;
  }
}
