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
