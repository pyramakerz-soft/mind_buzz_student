import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/error/failures_messages.dart';
import '../../../../reports/domain/use_cases/parent_reports_use_cases.dart';
import '../../../../student_assignment/domain/entities/main_data_test.dart';
import '../../../../student_assignment/domain/usecases/parent_assignment_use_cases.dart';
part 'get_assignment_event.dart';
part 'get_assignment_state.dart';

class GetAssignmentBloc extends Bloc<GetAssignmentEvent, GetAssignmentState> {
  final ParentAssignmentUseCases programUserUseCases;
  final ParentReportsUseCases programReportsUserUseCases;

  GetAssignmentBloc(
      {required this.programReportsUserUseCases,
      required this.programUserUseCases})
      : super(GetAssignmentInitial()) {
    on<GetAssignmentEvent>((event, emit) async {
      log('event##:$event');
      if (event is GetAssignmentRequest) {
        emit(GetProgramsLoadingInitial());
        final failureOrDoneMessage = await programUserUseCases(
            idProgram: event.programId,
            status: event.status,
            fromDate: event.fromDate,
            toDate: event.toDate,
            isFuture:false,
            listOfTypes: event.listOfTypes);
        emit(_eitherLoadedOrErrorState(failureOrDoneMessage));
      } else if (event is GetReportsRequest) {
        emit(GetProgramsLoadingInitial());
        final failureOrDoneMessage = await programReportsUserUseCases(
            fromDate: event.fromDate,
            toDate: event.toDate,
            selectedType: event.selectedType);
        emit(_eitherLoadedOrErrorState(failureOrDoneMessage));
      }
    });
  }
}

GetAssignmentState _eitherLoadedOrErrorState(
  Either<Failure, MainDataTestsModel> failureOrTrivia,
) {
  return failureOrTrivia.fold(
    (failure) =>
        GetProgramsErrorInitial(message: _mapFailureToMessage(failure)),
    (data) => GetProgramsCompleteInitial(data: data),
  );
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
