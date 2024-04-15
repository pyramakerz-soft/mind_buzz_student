part of 'color_rods_cubit.dart';

class ColorRodsInitial extends Equatable {
  final int? selectedColor;
  final List<Color>? selectedColorsOfBox;

  const ColorRodsInitial({this.selectedColor, this.selectedColorsOfBox});
  ColorRodsInitial copyWith(
      {int? selectedColor, List<Color>? selectedColorsOfBox}) {
    return ColorRodsInitial(
        selectedColor: selectedColor ?? this.selectedColor,
        selectedColorsOfBox:selectedColorsOfBox?? this.selectedColorsOfBox

    );
  }
  @override
  List<Object?> get props => [selectedColor, selectedColorsOfBox];
}
