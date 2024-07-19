import 'package:dartz/dartz.dart';
import 'package:mind_buzz_refactor/features/notification/domain/entities/notification_item_model.dart';

import '../../../../core/error/failures.dart';
import '../entities/main_of_notifications_model.dart';

abstract class NotificationRepository {
  Future<Either<Failure, MainOfNotificationsModel>> getNotifications(
      {required bool isRead});
}
