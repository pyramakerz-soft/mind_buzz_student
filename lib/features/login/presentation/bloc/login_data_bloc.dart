import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/failures_messages.dart';
import '../../domain/entities/user_data_model.dart';
import '../../domain/usecases/user_use_cases.dart';

part 'login_data_event.dart';
part 'login_data_state.dart';

class LoginDataBloc extends Bloc<LoginDataEvent, LoginDataState> {
  final UserUseCases requestLoginData;

  LoginDataBloc({required this.requestLoginData}) : super(LoginDataInitial()) {
    on<LoginDataEvent>((event, emit) async {
      if (event is LoginRequest){
        log('inside state:$state');
        emit(LoadingLoginState());
        await Future.delayed(Duration(milliseconds: 500));
        log('inside state:$state');
        final failureOrDoneMessage =
            await requestLoginData(email: event.email, password: event.password);
        emit(_eitherLoadedOrErrorState(failureOrDoneMessage));
        log('inside state:$state');
      }
    });
  }
}

LoginDataState _eitherLoadedOrErrorState(
    Either<Failure, UserData> failureOrTrivia,
    ) {
  return failureOrTrivia.fold(
        (failure) => ErrorLogin(message: _mapFailureToMessage(failure)),
        (data) => CompleteLogin(
        userData: data),
  );
}

String _mapFailureToMessage(Failure failure) {
  log('failure:$failure');

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
