import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/tests_types_model.dart';

part 'bottom_state.dart';

class BottomCubit extends Cubit<BottomInitial> {
  final String? selectedState;
  final List<String>? selectedType;
  final String? selectedFromDate;
  final String? selectedToDate;
  final List<TestsTypesModel>? testTypes;
  BottomCubit(
      {this.selectedState,
      this.selectedType,
        this.testTypes,
        this.selectedFromDate,
      this.selectedToDate})
      : super(BottomInitial()) {
    emit(state.copyWith(
        selectedState: selectedState,
        selectedType: selectedType,
        selectedFromDate: selectedFromDate,
        selectedToDate: selectedToDate));
  }

  submitAssignmentStatus({required String newStatus}) {
    emit(state.copyWith(selectedState: newStatus));
  }

  submitAssignmentType({required String newStatus}) async {
    String? selectedState = state.selectedState;
    List<TestsTypesModel>? testTypes = state.testTypes;
    String? selectedFromDate = state.selectedFromDate;
    String? selectedToDate = state.selectedToDate;
    List<String> currentSelectedTypes = state.selectedType??[];
    emit(SubBottomInitial());
    if(currentSelectedTypes.contains(newStatus)){
      currentSelectedTypes.remove(newStatus);
    }else{
      currentSelectedTypes.add(newStatus);
    }
    emit(BottomInitial(
        selectedState: selectedState,
        selectedType: currentSelectedTypes,
        selectedFromDate: selectedFromDate,
        selectedToDate: selectedToDate,
      testTypes: testTypes
    ));
  }

  submitAssignmentFromDate({required String newStatus}) {
    emit(state.copyWith(selectedFromDate: newStatus));
  }

  submitAssignmentToDate({required String newStatus}) {
    emit(state.copyWith(selectedToDate: newStatus));
  }
  submitListAssignmentTypes({required List<TestsTypesModel> newStatus, required String programId}) {

    emit(state.copyWith(testTypes: newStatus, programId:programId));
  }
}
