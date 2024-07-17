import 'package:mind_buzz_refactor/features/notification/domain/entities/notification_item_model.dart';
import 'package:mind_buzz_refactor/features/notification/domain/repositories/repositories_notification.dart';

class GetNotificationsUseCase {
  final NotificationRepository _repository;

  GetNotificationsUseCase({required NotificationRepository repository})
      : _repository = repository;

  Future<List<NotificationItemModel>> call({required bool isRead}) =>
      _repository.getNotifications(isRead: isRead);
}
