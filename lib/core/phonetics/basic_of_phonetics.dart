import 'package:flutter/animation.dart';

import 'assets_images_phonetics.dart';
import 'basic_of_every_game.dart';

abstract class MainDataOfPhonetics {
  late String basicAvatar;
  late String winAvatar;
  late String idelAvatar;
  late String sadAvatar;
  late String background;
   BasicOfEveryGame? gameData;
  late Color backGroundOfStarBar;
  static String letterS = 's';
  static String letterA = 'a';
}

class SPhonetics implements  MainDataOfPhonetics{
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xff114677);

  @override
  String background = AppImagesPhonetics.backGroundOfS;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar= AppImagesPhonetics.snowmanHappyRiv;

  SPhonetics({required this.mineGameData}){
    gameData = mineGameData;
  }

  @override
  String idelAvatar= AppImagesPhonetics.snowmanIdleRiv;

}
class APhonetics implements  MainDataOfPhonetics{
  final BasicOfEveryGame mineGameData;
  @override
  Color backGroundOfStarBar = const Color(0xff1481D1);

  @override
  String background = AppImagesPhonetics.backGroundOfA;

  @override
  String basicAvatar = AppImagesPhonetics.basicAvatarNormal;

  @override
  String sadAvatar = AppImagesPhonetics.snowmanSadRiv;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar= AppImagesPhonetics.snowmanHappyRiv;

  APhonetics({required this.mineGameData}){
    gameData = mineGameData;
  }

  @override
  String idelAvatar= AppImagesPhonetics.snowmanIdleRiv;

}
