import 'dart:developer';

import 'package:flutter_tts/flutter_tts.dart';

abstract class TalkTts {
  static FlutterTts flutterTts = FlutterTts();

  static startTalk(
      {required String text,
      Function? actionOfStart,
      Function? actionPause,
      Function? actionCancel,
      Function? actionComplete}) async {
    log('start talk:$text');
    flutterTts.setPitch(1.0);
    flutterTts.setSpeechRate(0.4);
    flutterTts.setStartHandler(() {
      log('tts start');
      if(actionOfStart != null) {
        actionOfStart();
      }
    });
    flutterTts.setCompletionHandler(() {
      log('tts completion');
      if(actionComplete != null) {
        actionComplete();
      }
    });
    flutterTts.setCancelHandler(() {
      log('tts Cancel');
      if(actionCancel != null) {
        actionCancel();
      }
    });
    flutterTts.setPauseHandler(() {
      log('tts Pause');
      if(actionPause != null) {
        actionPause();
      }
    });
    flutterTts.awaitSpeakCompletion(true);
    await flutterTts.speak(text);
  }

  static stopTalk() async {
    await flutterTts.stop();
  }
}
