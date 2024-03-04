import 'dart:developer';

import 'package:flutter_tts/flutter_tts.dart';

abstract class TalkTts {
  static FlutterTts flutterTts = FlutterTts();

  static startTalk({required String text}) async {
    flutterTts.setPitch(1.0);
    flutterTts.setSpeechRate(0.4);
    flutterTts.setStartHandler(() {
      log('setStartHandler');
    });
    flutterTts.setCompletionHandler(() {
      log('setCompletionHandler');
    });
    flutterTts.awaitSpeakCompletion(true);
    await flutterTts.speak(text);
  }
}
