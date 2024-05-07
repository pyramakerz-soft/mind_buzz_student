import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../student_assignment/domain/entities/main_data_test.dart';
import '../../../student_assignment/domain/usecases/program_use_cases.dart';



part 'calender_event.dart';
part 'calender_state.dart';

class CalenderBloc extends Bloc<CalenderEvent, CalenderState> {
  final ParentAssignmentUseCases programUserUseCases;


  CalenderBloc({required this.programUserUseCases}) : super(GetCalenderInitial()) {
    on<GetCalenderRequest>((event, emit) async {
      // await getAssignments(programId: event.);

    });
  }


  getAssignments(emit, {required int programId}) async {
    emit(GetCalenderLoadingInitial());
    try {
      var res = await programUserUseCases(idProgram: programId);
      res.fold((l) {
        log('getUserData fold $l');
        emit(GetCalenderErrorInitial(message: _mapFailureToMessage(l)));
      }, (data) {
        log('getUserDataSuccessfullyState ');
        emit(GetCalenderCompleteInitial(testsData: data));
      });
    } catch (e) {
      log('getUserData $e ');
      emit(GetCalenderErrorInitial(message: e.toString()));
    }
  }
}



String _mapFailureToMessage(Failure failure) {

  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case LoginFailure:
      return Login_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    case ReLoginFailure:
      return RELOGIN_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}