import 'package:mind_buzz_refactor/features/notification/domain/entities/notification_item_model.dart';

abstract class NotificationRepository {
  Future<List<NotificationItemModel>> getNotifications({required bool isRead});
}
