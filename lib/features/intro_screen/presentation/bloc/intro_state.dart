import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class IntroState extends Equatable {
  final Artboard? riveArtboardBees;
  final Artboard? riveArtboardBeeCharacter;
  final Animation<double>? animation;
  bool? showTheButton = false;
  final AnimationController? controller;

  IntroState(
      {this.riveArtboardBees,
      this.riveArtboardBeeCharacter,
      this.animation,
      this.showTheButton,
      this.controller});

  IntroState copyWith({
    Artboard? riveArtboardBees,
    Artboard? riveArtboardBeeCharacter,
    Animation<double>? animation,
    bool? showTheButton,
    AnimationController? controller,
  }) {
    return IntroState(
        riveArtboardBees: riveArtboardBees ?? this.riveArtboardBees,
        riveArtboardBeeCharacter:
            riveArtboardBeeCharacter ?? this.riveArtboardBeeCharacter,
        animation: animation ?? this.animation,
        showTheButton: showTheButton ?? this.showTheButton,
        controller: controller ?? this.controller);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        riveArtboardBees,
        animation,
        showTheButton,
        controller,
        riveArtboardBeeCharacter
      ];
}
