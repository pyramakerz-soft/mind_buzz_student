import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:mind_buzz_refactor/features/notification/domain/usecase/get_notifications_use_case.dart';
import 'package:mind_buzz_refactor/features/notification/presentation/manager/cubit/notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  NotificationCubit(this._getNotificationsUseCase)
      : super(NotificationState(status: NotificationStateStatus.initial));
  Future<void> getNotifications({required bool isRead}) async {
    final stateIsRead = state.isRead;
    final isReadInt = isRead ? 1 : 0;
    if (stateIsRead == isReadInt) return;
    emit(state.copyWith(status: NotificationStateStatus.loading));
    try {
      emit(state.copyWith(isRead: isRead ? 1 : 0));
      final notifications = await _getNotificationsUseCase.call(isRead: isRead);
      emit(
        state.copyWith(
          status: NotificationStateStatus.loaded,
          notifications: notifications,
        ),
      );
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
}
