import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mind_buzz_refactor/features/notification/domain/usecase/get_notifications_use_case.dart';
import 'package:mind_buzz_refactor/features/notification/presentation/manager/cubit/notification_state.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/error/failures_messages.dart';
import '../../../domain/entities/main_of_notifications_model.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  NotificationCubit(this._getNotificationsUseCase)
      : super(NotificationState(status: NotificationStateStatus.initial));
  Future<void> getNotifications({required bool isRead}) async {
    emit(state.copyWith(status: NotificationStateStatus.loading));
    try {
      emit(state.copyWith(isRead: isRead ? 1 : 0));
      final notifications = await _getNotificationsUseCase.call(isRead: isRead);
      emit(_eitherLoadedOrErrorState(notifications));
    } catch (e) {
      emit(
        state.copyWith(
          status: NotificationStateStatus.error,
          message: e is DioException
              ? e.type == DioExceptionType.connectionError ||
                      e.type == DioExceptionType.connectionTimeout
                  ? "Check Your network"
                  : "Server Error"
              : e.toString(),
        ),
      );
    }
  }

  Future<void> selectNotificationsTab({required bool isRead}) async {
    final stateIsRead = state.isRead;
    final isReadInt = isRead ? 1 : 0;
    if (stateIsRead == isReadInt) return;
    await getNotifications(isRead: isRead);
  }

  NotificationState _eitherLoadedOrErrorState(
    Either<Failure, MainOfNotificationsModel> failureOrTrivia,
  ) {
    NotificationState tempState = failureOrTrivia.fold(
        (failure) => state.copyWith(
            status: NotificationStateStatus.error,
            message: _mapFailureToMessage(failure)), (data) {
      print('data:${data.notifications?.length}');
      return state.copyWith(
        notifications: data.notifications,
        status: NotificationStateStatus.loaded,
      );
    });
    return tempState;
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
