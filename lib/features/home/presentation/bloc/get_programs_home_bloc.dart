import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../login/presentation/bloc/login_data_bloc.dart';
import '../../domain/entities/user_courses.dart';
import '../../domain/usecases/logout_use_cases.dart';
import '../../domain/usecases/program_use_cases.dart';

part 'get_programs_home_event.dart';
part 'get_programs_home_state.dart';

class GetProgramsHomeBloc
    extends Bloc<GetProgramsHomeEvent, GetProgramsHomeState> {
  final ProgramUserUseCases programUserUseCases;
  final LogOutUserUseCases logOutUserUseCases;

  GetProgramsHomeBloc(
      {required this.logOutUserUseCases, required this.programUserUseCases})
      : super(GetProgramsHomeInitial()) {
    on<GetProgramsHomeEvent>((event, emit) async {
      log('event##:$event');
      if (event is GetProgramsRequest) {
        emit(GetProgramsLoadingInitial());
        final failureOrDoneMessage = await programUserUseCases();
        emit(_eitherLoadedOrErrorState(failureOrDoneMessage));
      } else if (event is LogOutRequest) {
        await logOutUserUseCases();
        emit(LogOutLoadingState());
      }
    });
  }
}

GetProgramsHomeState _eitherLoadedOrErrorState(
  Either<Failure, List<UserCourseModel>> failureOrTrivia,
) {
  return failureOrTrivia.fold(
    (failure) =>
        GetProgramsErrorInitial(message: _mapFailureToMessage(failure)),
    (data) => GetProgramsCompleteInitial(
        data: data,
        isHaveAssignments: data.fold(
                0,
                (previousValue, element) =>
                    (element.program?.studentTests?.length ?? 0) +
                    (int.parse('$previousValue'))) >
            0),
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
