part of 'beads_matching_cubit.dart';
class BeadsMatchingInitial extends Equatable {
  bool? activeButton = true;

  BeadsMatchingInitial({this.activeButton});
  BeadsMatchingInitial copyWith({
    bool? activeButton,
  }) {
    return BeadsMatchingInitial(activeButton: activeButton ?? this.activeButton);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [activeButton];

}
