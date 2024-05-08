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

  submitAssignmentType({required String newStatus}) {
    List<String> currentSelectedTypes = state.selectedType??[];
    if(currentSelectedTypes.contains(newStatus)){
      print('########');
      currentSelectedTypes.remove(newStatus);
      emit(state.copyWith(selectedType: currentSelectedTypes));

    }else{
      print('----------');
      currentSelectedTypes.add(newStatus);
      emit(state.copyWith(selectedType: currentSelectedTypes));
    }
    emit(state);
    print('currentSelectedTypes:$currentSelectedTypes');
    print('----currentSelectedTypes:${state.selectedType}');

  }

  submitAssignmentFromDate({required String newStatus}) {
    emit(state.copyWith(selectedFromDate: newStatus));
  }

  submitAssignmentToDate({required String newStatus}) {
    emit(state.copyWith(selectedToDate: newStatus));
  }
  submitListAssignmentTypes({required List<TestsTypesModel> newStatus}) {

    emit(state.copyWith(testTypes: newStatus));
  }
}
