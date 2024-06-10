import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import '../../../features/phonetics/presentation/games/tracing/widget/letter_m.dart';
import '../../../features/phonetics/presentation/games/tracing/widget/letter_s.dart';
import 'assets_images_arabic.dart';
import 'basic_of_arabic_game.dart';

enum MainDataOfArabicTypes {
  redUnit
}

extension TypeExtension on MainDataOfArabicTypes {
  String text() {
    switch (this) {
      case MainDataOfArabicTypes.redUnit:
        return "redUnit".toLowerCase();
    }
  }
}

abstract class MainDataOfArabic {
  late String basicAvatar;
  late String winAvatar;
  late String idelAvatar;
  late String sadAvatar;
  late String background;
  BasicOfEveryGameArabic? gameData;
  late Color backGroundOfStarBar;
  CustomPainter? Function(List<Color?>? colorsOfPaths)? get tracingOfLetter;
  int? Function(Offset point, Size size)? get checkTheIndexOfPath;
  late int? countOfPartsOfLettersForTracing = 0;

  static getGameDataType(
      {required String subLetter,
      required String subGame,
      required int audioFlag}) {
    if (subLetter.toLowerCase() == MainDataOfArabicTypes.redUnit.text()) {
      return RedPhonetics(
          mineGameData: BasicOfEveryGameArabic.getTheGameType(
              gameType: subGame.toLowerCase(), audioFlag: audioFlag));
    }
  }
}

class RedPhonetics implements MainDataOfArabic {
  final BasicOfEveryGameArabic mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xffFFFFFF).withOpacity(.1);

  @override
  String background = AppImagesArabic.bgOfRedUnit;

  @override
  String basicAvatar = AppImagesArabic.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesArabic.beeFailureRiv;

  @override
  BasicOfEveryGameArabic? gameData;

  @override
  String winAvatar = AppImagesArabic.beeSuccess;

  RedPhonetics({required this.mineGameData}) {
    gameData = mineGameData;
  }

  @override
  String idelAvatar = AppImagesArabic.beeIdleRiv;

  @override
  int? countOfPartsOfLettersForTracing = 14;

  @override
  CustomPainter? Function(List<Color?>? colorsOfPaths) get tracingOfLetter =>
      (List<Color?>? colorsOfPaths) {
        return FlipBookPainterLetterS(colorsOfPaths: colorsOfPaths);
      };
  @override
  int? Function(Offset point, Size size)? get checkTheIndexOfPath =>
      (Offset point, Size size) {
        return FlipBookPainterLetterS.indexOfPointInside(point, size);
      };
}