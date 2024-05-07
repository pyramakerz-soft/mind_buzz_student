import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/error/failures_messages.dart';
import '../../../domain/entities/main_data_test.dart';
import '../../../domain/usecases/program_use_cases.dart';

part 'get_assignment_event.dart';
part 'get_assignment_state.dart';

class GetAssignmentBloc extends Bloc<GetAssignmentEvent, GetAssignmentState> {
  final ParentAssignmentUseCases programUserUseCases;


  GetAssignmentBloc({required this.programUserUseCases}) : super(GetAssignmentInitial()) {
    on<GetAssignmentEvent>((event, emit) async {
      log('event##:$event');
      if(event is GetAssignmentRequest){
        emit(GetProgramsLoadingInitial());
        final failureOrDoneMessage =
        await programUserUseCases(idProgram:event.programId);
        emit(_eitherLoadedOrErrorState(failureOrDoneMessage));
      }
    });
  }
}




GetAssignmentState _eitherLoadedOrErrorState(
    Either<Failure, MainDataTestsModel> failureOrTrivia,
    ) {
  return failureOrTrivia.fold(
        (failure) => GetProgramsErrorInitial(message: _mapFailureToMessage(failure)),
        (data) => GetProgramsCompleteInitial(
        data: data),
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