import 'package:dartz/dartz.dart';
import 'package:mind_buzz_refactor/features/notification/domain/entities/notification_item_model.dart';
import 'package:mind_buzz_refactor/features/notification/domain/repositories/repositories_notification.dart';

import '../../../../core/error/failures.dart';
import '../entities/main_of_notifications_model.dart';

class GetNotificationsUseCase {
  final NotificationRepository _repository;

  GetNotificationsUseCase({required NotificationRepository repository})
      : _repository = repository;

  Future<Either<Failure, MainOfNotificationsModel>> call(
      {required bool isRead}) async {
    Either<Failure, MainOfNotificationsModel> x =
        await _repository.getNotifications(isRead: isRead);
    return x;
  }
}
