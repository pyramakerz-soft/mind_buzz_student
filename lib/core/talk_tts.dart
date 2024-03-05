import 'dart:developer';

import 'package:flutter_tts/flutter_tts.dart';

abstract class TalkTts {
  static FlutterTts flutterTts = FlutterTts();

  static startTalk({required String text}) async {
    flutterTts.setPitch(1.0);
    flutterTts.setSpeechRate(0.4);
    flutterTts.setStartHandler(() {
      log('tts start');
    });
    flutterTts.setCompletionHandler(() {
      log('tts completion');
    });
    flutterTts.awaitSpeakCompletion(true);
    await flutterTts.speak(text);
  }

  static stopTalk() async {
    await flutterTts.stop();

  }
}
