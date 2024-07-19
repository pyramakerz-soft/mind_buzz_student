// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/assignments_percentages.dart';

import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/course.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/reports_percentages.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/test_model.dart';
import 'package:mind_buzz_refactor/features/notification/domain/entities/notification_item_model.dart';

enum NotificationStateStatus { initial, loading, loaded, error }

extension NotificationStateX on NotificationState {
  bool get isInitial => status == NotificationStateStatus.initial;
  bool get isLoading => status == NotificationStateStatus.loading;
  bool get isLoaded => status == NotificationStateStatus.loaded;
  bool get isError => status == NotificationStateStatus.error;
}

class NotificationState {
  final NotificationStateStatus status;
  final List<NotificationItemModel> notifications;
  final int isRead;
  final num? countOfNotification;
  final String? message;
  NotificationState({
    this.status = NotificationStateStatus.initial,
    this.isRead = 0,
    this.notifications = const [],
    this.message,
    this.countOfNotification,
  });

  NotificationState copyWith({
    NotificationStateStatus? status,
    int? isRead,
    num? countOfNotification,
    List<NotificationItemModel>? notifications,
    String? message,
  }) {
    return NotificationState(
      status: status ?? this.status,
      isRead: isRead ?? this.isRead,
      countOfNotification: countOfNotification ?? this.countOfNotification,
      notifications: notifications ?? this.notifications,
      message: message ?? this.message,
    );
  }

  @override
  bool operator ==(covariant NotificationState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.isRead == isRead &&
        other.countOfNotification == countOfNotification &&
        listEquals(other.notifications, notifications) &&
        other.message == message;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        isRead.hashCode ^
        countOfNotification.hashCode ^
        Object.hashAll(notifications) ^
        message.hashCode;
  }

  @override
  String toString() {
    return 'NotificationState(status: $status, notifications: $notifications,isRead: $isRead , message: $message)';
  }
}
