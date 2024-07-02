import 'image_details.dart';

class ImagesToPaint {
  final List<ImageDetails> bgImages;
  // final ImageDetails? startLevelImage;
  // final ImageDetails completedLevelImage;
  // final ImageDetails currentLevelImage;
  // final ImageDetails lockedLevelImage;
  // final ImageDetails? pathEndImage;

  ImagesToPaint({
    // required this.completedLevelImage,
    // required this.currentLevelImage,
    // required this.lockedLevelImage,
    required this.bgImages,
    // this.startLevelImage,
    // this.pathEndImage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImagesToPaint &&
          runtimeType == other.runtimeType &&
          bgImages == other.bgImages;

  @override
  int get hashCode => bgImages.hashCode;
}
