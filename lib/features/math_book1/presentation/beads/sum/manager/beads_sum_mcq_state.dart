part of 'beads_sum_mcq_cubit.dart';

class BeadsSumMcqInitial extends Equatable {
  bool? activeButton = true;
  BeadsSumMcqInitial({this.activeButton});
  BeadsSumMcqInitial copyWith({
    bool? activeButton,
  }) {
    return BeadsSumMcqInitial(activeButton: activeButton ?? this.activeButton);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [activeButton];
}
