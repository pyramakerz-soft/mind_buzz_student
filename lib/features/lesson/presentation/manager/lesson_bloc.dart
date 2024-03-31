import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/failures_messages.dart';
import '../../domain/entities/lesson_model.dart';
import '../../domain/use_cases/lesson_use_cases.dart';

part 'lesson_event.dart';
part 'lesson_state.dart';

class LessonBloc extends Bloc<LessonEvent, LessonState> {
  final LessonUseCases programUserUseCases;

  LessonBloc({required this.programUserUseCases}) : super(GetLessonInitial()) {
    on<LessonEvent>((event, emit) async {
      log('event##:$event');
      if (event is GetUnitRequest) {
        emit(GetProgramsLoadingInitial());
        final failureOrDoneMessage =
            await programUserUseCases(programId: event.programId);
        emit(_eitherLoadedOrErrorState(failureOrDoneMessage));
      }
    });
  }
}


LessonState _eitherLoadedOrErrorState(
    Either<Failure, List<LessonModel>> failureOrTrivia,
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
    default:
      return 'Unexpected error';
  }
}