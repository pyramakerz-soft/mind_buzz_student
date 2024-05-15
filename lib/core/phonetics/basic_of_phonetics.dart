import 'package:flutter/animation.dart';

import 'assets_images_phonetics.dart';
import 'basic_of_every_game.dart';

abstract class MainDataOfPhonetics {
  late String basicAvatar;
  late String winAvatar;
  late String sadAvatar;
  late String background;
   BasicOfEveryGame? gameData;
  late Color backGroundOfStarBar;
  static String letterS = 's';
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
  String sadAvatar = AppImagesPhonetics.sadAvatarSad;

  @override
  BasicOfEveryGame? gameData;

  @override
  String winAvatar= AppImagesPhonetics.winAvatar;

  SPhonetics({required this.mineGameData}){
    gameData = mineGameData;
  }

}
