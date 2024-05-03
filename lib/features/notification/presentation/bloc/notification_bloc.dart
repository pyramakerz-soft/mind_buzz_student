import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/error/failures_messages.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {



  NotificationsBloc() : super(GetProgramsHomeInitial()) {
    on<NotificationsEvent>((event, emit) async {
      log('event##:$event');
      if(event is GetNotificationsRequest){

      }

    });
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