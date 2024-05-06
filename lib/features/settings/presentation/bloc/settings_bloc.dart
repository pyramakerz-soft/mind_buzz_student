import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mind_buzz_refactor/features/login/domain/entities/user_data_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../login/domain/usecases/auto_user_use_cases.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AutoUserUseCases autoUserUseCases;


  SettingsBloc({required this.autoUserUseCases}) : super(GetSettingsInitial()) {
    on<GetUserData>((event, emit) async {
      await getUserData(emit);
    });
  }


  getUserData(emit) async {
    emit(GetSettingsLoadingInitial());
    try {
    var res = await autoUserUseCases();
    res.fold((l) {
      log('getUserData fold $l');
      emit(GetSettingsErrorInitial(message: _mapFailureToMessage(l)));
    }, (data) {

      log('getUserDataSuccessfullyState ');
      emit(GetUserDataSuccessfully(userData: data));
    });
    } catch (e) {
      log('getUserData $e ');
      emit(GetSettingsErrorInitial(message: e.toString()));
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