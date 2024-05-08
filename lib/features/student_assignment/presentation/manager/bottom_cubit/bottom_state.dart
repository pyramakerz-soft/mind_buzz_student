part of 'bottom_cubit.dart';

class BottomInitial extends Equatable {
  final String? selectedState;
  final List<String>? selectedType;
  final String? selectedFromDate;
  final String? selectedToDate;
  final List<TestsTypesModel>? testTypes;
  BottomInitial(
      {this.selectedState,
      this.selectedType,
      this.testTypes,
      this.selectedFromDate,
      this.selectedToDate});

  BottomInitial copyWith(
      {String? selectedState,
      List<String>? selectedType,
        List<TestsTypesModel>? testTypes,
      String? selectedFromDate,
      String? selectedToDate}) {
    return BottomInitial(
        selectedState: selectedState ?? this.selectedState,
        testTypes: testTypes ?? this.testTypes,
        selectedFromDate: selectedFromDate ?? this.selectedFromDate,
        selectedToDate: selectedToDate ?? this.selectedToDate,
        selectedType: selectedType);
  }

  @override
  List<Object?> get props => [selectedFromDate, selectedType, selectedToDate, selectedState, testTypes];
}
