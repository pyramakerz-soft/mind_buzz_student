import 'assets_sound.dart';

abstract class Connection {
  Connection._();

  static const base = 'pyra.qaseralnjoom.com';
  static const baseURL = 'https://$base/api/';
}

double widthAndHeight = 120;

abstract class GetCurrent {
  GetCurrent._();

  // static superGetImageBasedOnLetter({required String superLetter}) {
  //   switch (superLetter) {
  //     case ('a'):
  //       return AppImages.iconALetter;
  //     case ('t'):
  //       return AppImages.iconTLetter;
  //     case ('m'):
  //       return AppImages.iconMLetter;
  //     case ('s'):
  //       return AppImages.iconSLetter;
  //   }
  // }

  static superGetSoundBasedOnLetter({required String superLetter}) {
    switch (superLetter) {
      case ('a'):
        return AppSound.letterA;
      case ('t'):
        return AppSound.letterT;
      case ('m'):
        return AppSound.letterM;
      case ('s'):
        return AppSound.letterS;
    }
  }
}
