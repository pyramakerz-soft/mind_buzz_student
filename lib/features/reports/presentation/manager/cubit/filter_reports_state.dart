part of 'filter_reports_cubit.dart';

@immutable
 class FilterReportsState extends Equatable {
  final String? selectedDate;
  final String? selectedType;

  FilterReportsState({this.selectedDate, this.selectedType});

  @override
  List<Object?> get props => [selectedDate, selectedType];

  FilterReportsState copyWith(
      {String? selectedDate, String? selectedType}) {
    return FilterReportsState(
        selectedDate: selectedDate ?? this.selectedDate,
        selectedType:
        selectedType ?? this.selectedType);
  }
}