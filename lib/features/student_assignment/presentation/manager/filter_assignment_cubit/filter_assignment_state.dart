part of 'filter_assignment_cubit.dart';

class FilterAssignmentInitial extends Equatable {
  final String? selectedState;
  final List<String>? selectedType;
  final String? selectedTypeReport;
  final String? selectedFromDate;
  final String? selectedDate;
  final String? programId;

  final String? selectedToDate;
  final List<TestsTypesModel>? testTypes;
  FilterAssignmentInitial(
      {this.selectedState,
      this.selectedType,
      this.testTypes,
      this.selectedDate,
      this.selectedTypeReport,
      this.programId,
      this.selectedFromDate,
      this.selectedToDate});

  FilterAssignmentInitial copyWith(
      {String? selectedState,
      List<String>? selectedType,
      List<TestsTypesModel>? testTypes,
      String? selectedFromDate,
      String? selectedDate,
      String? selectedTypeReport,
      String? programId,
      String? selectedToDate}) {
    return FilterAssignmentInitial(
        selectedState: selectedState ?? this.selectedState,
        testTypes: testTypes ?? this.testTypes,
        selectedFromDate: selectedFromDate ?? this.selectedFromDate,
        selectedToDate: selectedToDate ?? this.selectedToDate,
        programId: programId ?? this.programId,
        selectedTypeReport: selectedTypeReport ?? this.selectedTypeReport,
        selectedDate: selectedDate ?? this.selectedDate,
        selectedType: selectedType ?? this.selectedType);
  }

  clearSelectedState() {
    return FilterAssignmentInitial(
        selectedState: null,
        testTypes: testTypes ?? testTypes,
        selectedFromDate: selectedFromDate ?? selectedFromDate,
        selectedToDate: selectedToDate ?? selectedToDate,
        selectedTypeReport: selectedTypeReport ?? selectedTypeReport,
        programId: programId ?? programId,
        selectedDate: selectedDate ?? selectedDate,
        selectedType: selectedType ?? selectedType);
  }

  @override
  List<Object?> get props => [
        selectedFromDate,
        selectedType,
        selectedDate,
        selectedToDate,
        selectedState,
        selectedTypeReport,
        testTypes,
        programId
      ];
}

class SubBottomInitial extends FilterAssignmentInitial {}
