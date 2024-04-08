part of 'color_rods_cubit.dart';

class ColorRodsInitial extends Equatable {
  final int? selectedColor;

  const ColorRodsInitial({this.selectedColor});
  ColorRodsInitial copyWith(
      {int? selectedColor}) {
    return ColorRodsInitial(
        selectedColor: selectedColor ?? this.selectedColor);
  }
  @override
  List<Object?> get props => [selectedColor];
}
