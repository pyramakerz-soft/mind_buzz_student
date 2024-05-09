import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'filter_reports_state.dart';

class FilterReportsCubit extends Cubit<FilterReportsState> {
  FilterReportsCubit() : super(FilterReportsState());

  submitNewType({required String newType}){
    emit(state.copyWith(selectedType:newType));
  }
  submitNewDate({required String newType}){
    emit(state.copyWith(selectedDate:newType));
  }
}
