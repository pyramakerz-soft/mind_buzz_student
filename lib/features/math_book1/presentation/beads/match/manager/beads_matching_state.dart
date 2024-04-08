part of 'beads_matching_cubit.dart';

class BeadsMatchingInitial extends Equatable {
  bool? activeButton = true;
  Offset? position1;
  Offset? position2;

  BeadsMatchingInitial({this.activeButton, this.position1, this.position2});
  BeadsMatchingInitial copyWith(
      {bool? activeButton, Offset? position1, Offset? position2}) {
    return BeadsMatchingInitial(
        activeButton: activeButton ?? this.activeButton,
        position1: position1 ?? this.position1,
        position2: position2 ?? this.position2);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [activeButton, position2, position1];
}
