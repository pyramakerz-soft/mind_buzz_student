import 'dart:math' hide log;

class AppSound {
  static const String mainPathOfSound = 'sound/';
  static const String mainPathOfSoundBase = 'sound/base/';
  static const String letterA = "${mainPathOfSound}a.mp3";
  static const String letterT = "${mainPathOfSound}t.mp3";
  static const String letterM = "${mainPathOfSound}m.mp3";
  static const String letterS = "${mainPathOfSound}s.mp3";
  static const String letterC = "${mainPathOfSound}c.mp3";
  static const String letterK = "${mainPathOfSound}c.mp3";
  // static const String successSound = "${mainPathOfSoundBase}success.mp3";
  static const String starSound = "${mainPathOfSoundBase}star_sound.wav";
  // static const String wrongAnswerSound = "${mainPathOfSoundBase}wrong_answer.ogg";
  static const String notThatOneSound =
      "${mainPathOfSoundBase}notThatOneSound.mp3";
  static const String notThatOneSound1 = "${mainPathOfSoundBase}notThatOneSound1.mp3";
  static const String youFoundItSound =
      "${mainPathOfSoundBase}youFoundItSound.mp3";
  static const String youFoundItSound1 = "${mainPathOfSoundBase}youFoundItSound1.mp3";
  static const String youFoundItSound2 = "${mainPathOfSoundBase}youFoundItSound2.mp3";
  static const String youFoundItSound3 = "${mainPathOfSoundBase}youFoundItSound3.mp3";
  static const String youFoundItSound4 = "${mainPathOfSoundBase}youFoundItSound4.mp3";

  static List ofSoundsOfCorrect = [
    youFoundItSound,
    youFoundItSound1,
    youFoundItSound2,
    youFoundItSound3,
    youFoundItSound4,
  ];

  static getRandomSoundOfCorrect() {
    Random random = Random();
    int randomIndex = random.nextInt(ofSoundsOfCorrect.length);
    return ofSoundsOfCorrect[randomIndex];
  }

  static List ofSoundsOfWrong = [
    notThatOneSound,
    notThatOneSound1,
  ];

  static getRandomSoundOfWrong() {
    Random random = Random();
    int randomIndex = random.nextInt(ofSoundsOfWrong.length);
    return ofSoundsOfWrong[randomIndex];
  }
  
    static getSoundOfLetter({required String mainGameLetter}) {
      if(mainGameLetter.toLowerCase()== 'a') {
            return AppSound.letterA;
      }
      if(mainGameLetter.toLowerCase()== 't') {
            return AppSound.letterT;
      }
      if(mainGameLetter.toLowerCase()== 'm') {
            return AppSound.letterM;
      }
      if(mainGameLetter.toLowerCase()== 's') {
            return AppSound.letterS;
      }  
      if(mainGameLetter.toLowerCase()== 'c') {
            return AppSound.letterC;
      } if(mainGameLetter.toLowerCase()== 'k') {
            return AppSound.letterK;
      }
    return AppSound.letterS;
  }
}
