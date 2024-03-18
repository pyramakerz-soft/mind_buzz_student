import 'package:flutter/material.dart';

import 'assets_images.dart';

extension EmptySpace on num {
  SizedBox get ph => SizedBox(height: toDouble());

  SizedBox get pw => SizedBox(width: toDouble());
}

abstract class PaperImages {
  static List paper = [
    AppImages.iconLevel1OfPaper,
    AppImages.iconLevel2OfPaper,
    AppImages.iconLevel3OfPaper,
    AppImages.iconLevel4OfPaper,
    AppImages.iconLevel5OfPaper,
  ];
}

enum StateOfAvatar { thinking, talking, stop, success, wrong }
enum TtsState { playing, stopped, forceStop }

bool stateOfAppIsOffline = true;


abstract class DefaultData {
  static const image = 'https://www.renaissance.com/wp-content/uploads/2023/04/star-phonics-header-2.webp';

}