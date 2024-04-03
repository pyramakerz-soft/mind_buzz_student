import 'dart:math' hide log;

class AppSound {
  static const String mainPathOfSound = 'sound/';
  static const String mainPathOfSoundBase = 'sound/base/';
  static const String letterA = "${mainPathOfSound}a.mp3";
  static const String letterT = "${mainPathOfSound}t.mp3";
  static const String letterM = "${mainPathOfSound}m.mp3";
  static const String letterS = "${mainPathOfSound}s.mp3";
  // static const String successSound = "${mainPathOfSoundBase}success.mp3";
  static const String starSound = "${mainPathOfSoundBase}star_sound.wav";
  // static const String wrongAnswerSound = "${mainPathOfSoundBase}wrong_answer.ogg";
  static const String notThatOneSound =
      "${mainPathOfSoundBase}not_that_one.ogg";
  static const String notThatOneSound1 = "${mainPathOfSoundBase}nope.ogg";
  static const String notThatOneSound2 = "${mainPathOfSoundBase}oops.ogg";
  static const String youFoundItSound =
      "${mainPathOfSoundBase}you_found_it.ogg";
  static const String youFoundItSound1 = "${mainPathOfSoundBase}good_job.ogg";
  static const String completeStarSound = "${mainPathOfSoundBase}yahoo.ogg";
  static const String rocketSound = "${mainPathOfSoundBase}rocket.wav";

  static List ofSoundsOfCorrect = [
    youFoundItSound,
    youFoundItSound1,
  ];

  static getRandomSoundOfCorrect() {
    Random random = Random();
    int randomIndex = random.nextInt(ofSoundsOfCorrect.length);
    return ofSoundsOfCorrect[randomIndex];
  }

  static List ofSoundsOfWrong = [
    notThatOneSound,
    notThatOneSound1,
    notThatOneSound2,
  ];

  static getRandomSoundOfWrong() {
    Random random = Random();
    int randomIndex = random.nextInt(ofSoundsOfWrong.length);
    return ofSoundsOfWrong[randomIndex];
  }
}
