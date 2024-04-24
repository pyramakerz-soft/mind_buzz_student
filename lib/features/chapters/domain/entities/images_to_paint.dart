


import 'package:mind_buzz_refactor/features/chapters/domain/entities/image_details.dart';

import '../../presentation/widgets/level_map_painter.dart';

class ImagesToPaint {
  final List<BGImage>? bgImages;
  final ImageDetails? startLevelImage;
  final ImageDetails completedLevelImage;
  final ImageDetails currentLevelImage;
  final ImageDetails lockedLevelImage;
  final ImageDetails? pathEndImage;

  ImagesToPaint({
    required this.completedLevelImage,
    required this.currentLevelImage,
    required this.lockedLevelImage,
    this.bgImages,
    this.startLevelImage,
    this.pathEndImage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is ImagesToPaint &&
              runtimeType == other.runtimeType &&
              bgImages == other.bgImages &&
              startLevelImage == other.startLevelImage &&
              currentLevelImage == other.currentLevelImage &&
              pathEndImage == other.pathEndImage &&
              lockedLevelImage == other.lockedLevelImage &&
              completedLevelImage == other.completedLevelImage;

  @override
  int get hashCode =>
      bgImages.hashCode ^
      startLevelImage.hashCode ^
      currentLevelImage.hashCode ^
      pathEndImage.hashCode ^
      lockedLevelImage.hashCode ^
      completedLevelImage.hashCode;
}
