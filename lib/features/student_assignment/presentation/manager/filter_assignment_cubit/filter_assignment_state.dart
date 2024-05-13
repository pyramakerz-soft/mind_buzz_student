part of 'filter_assignment_cubit.dart';

class FilterAssignmentInitial extends Equatable {
  final String? selectedState;
  final List<String>? selectedType;
  final String? selectedTypeReport;
  final String? selectedFromDate;
  final String? selectedDateReport;
  final String? programId;

  final String? selectedToDate;
  final List<TestsTypesModel>? testTypes;
  FilterAssignmentInitial(
      {this.selectedState,
      this.selectedType,
      this.testTypes,
      this.selectedDateReport,
      this.selectedTypeReport,
      this.programId,
      this.selectedFromDate,
      this.selectedToDate});

  FilterAssignmentInitial copyWith(
      {String? selectedState,
      List<String>? selectedType,
      List<TestsTypesModel>? testTypes,
      String? selectedFromDate,
      String? selectedDateReport,
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
        selectedDateReport: selectedDateReport ?? this.selectedDateReport,
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
        selectedDateReport: selectedDateReport ?? selectedDateReport,
        selectedType: selectedType ?? selectedType);
  }

  clearFilter() {
    return FilterAssignmentInitial(
        selectedState: null,
        testTypes: testTypes ?? testTypes,
        selectedFromDate: null,
        selectedTypeReport: null,
        selectedToDate: null,
        programId: programId ?? programId,
        selectedDateReport: null,
        selectedType: null);
  }

  clearReportFilter() {
    return FilterAssignmentInitial(
        selectedState: selectedState ?? selectedState,
        testTypes: testTypes ?? testTypes,
        selectedFromDate: selectedFromDate ?? selectedFromDate,
        selectedToDate: selectedToDate ?? selectedToDate,
        selectedTypeReport: null,
        programId: programId ?? programId,
        selectedDateReport: null,
        selectedType: selectedType ?? selectedType);
  }

  clearAssignmentFilter() {
    return FilterAssignmentInitial(
        selectedState: null,
        testTypes: testTypes ?? testTypes,
        selectedFromDate: null,
        selectedTypeReport: selectedTypeReport ?? selectedTypeReport,
        selectedToDate: null,
        programId: programId ?? programId,
        selectedDateReport: null,
        selectedType: null);
  }

  @override
  List<Object?> get props => [
        selectedFromDate,
        selectedType,
        selectedDateReport,
        selectedToDate,
        selectedState,
        selectedTypeReport,
        testTypes,
        programId
      ];
}

class SubBottomInitial extends FilterAssignmentInitial {}
