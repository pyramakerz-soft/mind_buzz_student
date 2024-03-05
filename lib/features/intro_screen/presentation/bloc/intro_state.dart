import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';

class IntroState extends Equatable {
  final Artboard? riveArtboardBees;
  final Artboard? riveArtboardBeeCharacter;
  final Animation<double>? animation;
  bool? showTheButton = false;
  double? position = 4;
  final AnimationController? controller;

  IntroState(
      {this.riveArtboardBees,
      this.riveArtboardBeeCharacter,
      this.animation,
       this.position,
      this.showTheButton,
      this.controller});

  IntroState copyWith({
    Artboard? riveArtboardBees,
    Artboard? riveArtboardBeeCharacter,
    Animation<double>? animation,
    bool? showTheButton,
    double? position,
    AnimationController? controller,
  }) {
    return IntroState(
        riveArtboardBees: riveArtboardBees ?? this.riveArtboardBees,
        riveArtboardBeeCharacter:
            riveArtboardBeeCharacter ?? this.riveArtboardBeeCharacter,
        animation: animation ?? this.animation,
        position: position ?? this.position,
        showTheButton: showTheButton ?? this.showTheButton,
        controller: controller ?? this.controller);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        riveArtboardBees,
        animation,
        showTheButton,
        position,
        controller,
        riveArtboardBeeCharacter
      ];
}
