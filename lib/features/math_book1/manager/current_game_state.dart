// part of 'curr_cubit.dart';

import 'package:equatable/equatable.dart';
import 'package:flame_rive/flame_rive.dart';
import 'package:flutter/animation.dart';

class CurrentGameInitial extends Equatable {
  int? index = 0;
  Artboard? giftBoxArtboard;
  AnimationStatus? candyAnimationController;
  AnimationStatus? rocketAnimationController;
  bool? activeButton = true;

  CurrentGameInitial(
      {this.index,
      this.candyAnimationController,
      this.giftBoxArtboard,
      this.activeButton,
      this.rocketAnimationController});
  CurrentGameInitial copyWith({
    int? index,
    AnimationStatus? candyAnimationController,
    Artboard? giftBoxArtboard,
    bool? activeButton,
    AnimationStatus? rocketAnimationController,
  }) {
    return CurrentGameInitial(
        index: index ?? this.index,
        activeButton: activeButton ?? this.activeButton,
        giftBoxArtboard: giftBoxArtboard ?? this.giftBoxArtboard,
        candyAnimationController:
            candyAnimationController ?? this.candyAnimationController,
        rocketAnimationController:
            rocketAnimationController ?? this.rocketAnimationController);
  }

  CurrentGameInitial clearGiftBoxArtboard() {
    return CurrentGameInitial(
        index: index ?? index,
        activeButton: activeButton ?? activeButton,
        giftBoxArtboard: null,
        candyAnimationController:
            candyAnimationController ?? candyAnimationController,
        rocketAnimationController:
            rocketAnimationController ?? rocketAnimationController);
  }

  @override
  List<Object?> get props => [
        index,
        rocketAnimationController,
        candyAnimationController,
        giftBoxArtboard,
        activeButton
      ];
}
