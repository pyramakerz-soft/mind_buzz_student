// // part of 'curr_cubit.dart';
//
// import 'package:equatable/equatable.dart';
// import 'package:flame_rive/flame_rive.dart';
// import 'package:flutter/animation.dart';
//
// class CurrentGameInitial extends Equatable {
//   int? index = 0;
//   Artboard? beeWinningArtboard;
//   AnimationStatus? candyAnimationController;
//   AnimationStatus? rocketAnimationController;
//   String? message;
//   String? title;
//
//   CurrentGameInitial(
//       {this.index,
//       this.candyAnimationController,
//       this.beeWinningArtboard,
//       this.message,
//       this.title,
//       this.rocketAnimationController});
//   CurrentGameInitial copyWith({
//     int? index,
//     AnimationStatus? candyAnimationController,
//     Artboard? beeWinningArtboard,
//     String? message,
//     String? title,
//     bool? activeButton,
//     AnimationStatus? rocketAnimationController,
//   }) {
//     return CurrentGameInitial(
//         index: index ?? this.index,
//         message: message ?? this.message,
//         title: title ?? this.title,
//         beeWinningArtboard: beeWinningArtboard ?? this.beeWinningArtboard,
//         candyAnimationController:
//             candyAnimationController ?? this.candyAnimationController,
//         rocketAnimationController:
//             rocketAnimationController ?? this.rocketAnimationController);
//   }
//
//   CurrentGameInitial clearGiftBoxArtboard() {
//     return CurrentGameInitial(
//         index: index ?? index,
//         message: message ?? message,
//         title: title ?? title,
//         beeWinningArtboard: null,
//         candyAnimationController:
//             candyAnimationController ?? candyAnimationController,
//         rocketAnimationController:
//             rocketAnimationController ?? rocketAnimationController);
//   }
//
//   @override
//   List<Object?> get props => [
//         index,
//         message,
//         title,
//         rocketAnimationController,
//         candyAnimationController,
//     beeWinningArtboard
//       ];
// }
