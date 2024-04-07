part of 'animation_unit_cubit.dart';

class AnimationUnitInitial extends Equatable {
  Artboard? beeArtboard1;
  Artboard? beeArtboard2;
  Artboard? beeArtboard3;
  Artboard? treeArtboard;
  Artboard? beeWaterArtboard;
  AnimationUnitInitial(
      {this.beeArtboard1,
      this.beeArtboard2,
      this.beeArtboard3,
      this.beeWaterArtboard,
      this.treeArtboard});

  AnimationUnitInitial copyWith({
    Artboard? beeArtboard1,
    Artboard? beeArtboard2,
    Artboard? beeArtboard3,
    Artboard? treeArtboard,
    Artboard? beeWaterArtboard,
  }) {
    return AnimationUnitInitial(
        beeArtboard1: beeArtboard1 ?? this.beeArtboard1,
        beeArtboard2: beeArtboard2 ?? this.beeArtboard2,
        beeArtboard3: beeArtboard3 ?? this.beeArtboard3,
        treeArtboard: treeArtboard ?? this.treeArtboard,
        beeWaterArtboard: beeWaterArtboard ?? this.beeWaterArtboard);
  }

  clearBee1() {
    return AnimationUnitInitial(
        beeArtboard1: null,
        beeArtboard2: beeArtboard2 ?? beeArtboard2,
        beeArtboard3: beeArtboard3 ?? beeArtboard3,
        treeArtboard: treeArtboard ?? treeArtboard,
        beeWaterArtboard: beeWaterArtboard ?? beeWaterArtboard);
  }

  clearBee2() {
    return AnimationUnitInitial(
        beeArtboard1: beeArtboard1 ?? beeArtboard1,
        beeArtboard2: null,
        beeArtboard3: beeArtboard3 ?? beeArtboard3,
        treeArtboard: treeArtboard ?? treeArtboard,
        beeWaterArtboard: beeWaterArtboard ?? beeWaterArtboard);
  }
  clearBee3() {
    return AnimationUnitInitial(
        beeArtboard1: beeArtboard1 ?? beeArtboard1,
        beeArtboard2: beeArtboard2 ?? beeArtboard2,
        beeArtboard3: null,
        treeArtboard: treeArtboard ?? treeArtboard,
        beeWaterArtboard: beeWaterArtboard ?? beeWaterArtboard);
  }
  clearTree() {
    return AnimationUnitInitial(
        beeArtboard1: beeArtboard1 ?? beeArtboard1,
        beeArtboard2: beeArtboard2 ?? beeArtboard2,
        beeArtboard3: beeArtboard3 ?? beeArtboard3,
        treeArtboard: null,
        beeWaterArtboard: beeWaterArtboard ?? beeWaterArtboard);
  }

  clearBeeWaterArtboard() {
    return AnimationUnitInitial(
        beeArtboard1: beeArtboard1 ?? beeArtboard1,
        beeArtboard2: beeArtboard2 ?? beeArtboard2,
        beeArtboard3: beeArtboard3 ?? beeArtboard3,
        treeArtboard: treeArtboard ?? treeArtboard,
        beeWaterArtboard: null);
  }

  @override
  List<Object?> get props => [
        beeArtboard1,
        beeArtboard2,
        beeArtboard3,
        treeArtboard,
        beeWaterArtboard
      ];
}
