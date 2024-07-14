import 'package:based_of_eng_game/based_of_eng_game.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/error/failures_messages.dart';
import '../../../domain/use_cases/contact_assignment_use_cases.dart';

part 'assignment_event.dart';
part 'assignment_state.dart';

class AssignmentBloc extends Bloc<AssignmentEvent, AssignmentState> {
  final ContactAssignmentUseCases getContactAssignmentUseCases;

  AssignmentBloc({required this.getContactAssignmentUseCases})
      : super(AssignmentInitial()) {
    on<AssignmentEvent>((event, emit) {});
    on<GetAssignmentDataEvent>((event, emit) async {
      emit(AssignmentLoadingInitial());
      final failureOrDoneMessage = await getContactAssignmentUseCases(
          testId: event.testId, programId: event.programId);
      emit(await _eitherLoadedOrErrorState(failureOrDoneMessage));
    });
  }
}

Future<AssignmentState> _eitherLoadedOrErrorState(
    Either<Failure, List<GameFinalModel>> failureOrTrivia) async {
  AssignmentState tempState = failureOrTrivia.fold(
    (failure) => AssignmentErrorInitial(message: _mapFailureToMessage(failure)),
    (data) => AssignmentDataInitial(data: data),
  );
  return tempState;
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
