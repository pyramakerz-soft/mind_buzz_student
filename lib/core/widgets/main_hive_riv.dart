import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RiveGame extends FlameGame {
  final String rive;

  RiveGame({required this.rive});

  @override
  Color backgroundColor() => Colors.transparent;
  Future<Artboard?> getTheBeeCharacterAvatar() async {
    Artboard? riveArtboardBeeCharacter;

    final load = await rootBundle.load(rive);

    final file = RiveFile.import(load);
    final artboard = file.mainArtboard;
    var controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');

    if (controller != null) {
      artboard.addController(controller);
    }
    riveArtboardBeeCharacter = artboard;
    return riveArtboardBeeCharacter;
  }

  @override
  Future<void> onLoad() async {
    final skillsArtboard = await getTheBeeCharacterAvatar();
    if (skillsArtboard != null) {
      add(SkillsAnimationComponent(skillsArtboard));
    }
  }
}

class SkillsAnimationComponent extends RiveComponent with TapCallbacks {
  SkillsAnimationComponent(Artboard artboard) : super(artboard: artboard);

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);
    this.size = size;
  }

  @override
  void onLoad() {
    final controller = StateMachineController.fromArtboard(
      artboard,
      "State Machine 1",
    );
    if (controller != null) {
      artboard.addController(controller);
    }
  }
}
