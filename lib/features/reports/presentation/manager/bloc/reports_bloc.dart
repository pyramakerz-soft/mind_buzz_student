import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/error/failures_messages.dart';
import '../../../../student_assignment/domain/entities/main_data_test.dart';
import '../../../domain/use_cases/parent_reports_use_cases.dart';

part 'reports_event.dart';
part 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  final ParentReportsUseCases programUserUseCases;

  ReportsBloc({required this.programUserUseCases}) : super(GetReportsInitial()) {
    on<ReportsEvent>((event, emit) async {
      if(event is GetReportsRequest){
        emit(GetReportsLoadingInitial());
        final failureOrDoneMessage =
            await programUserUseCases(date:event.date);
        emit(_eitherLoadedOrErrorState(failureOrDoneMessage));
      }
    });
  }
}


ReportsState _eitherLoadedOrErrorState(
    Either<Failure, MainDataTestsModel> failureOrTrivia,
    ) {
  return failureOrTrivia.fold(
        (failure) => GetReportsErrorInitial(message: _mapFailureToMessage(failure)),
        (data) => GetReportsCompleteInitial(
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