import 'package:mind_buzz_refactor/features/notification/domain/entities/notification_item_model.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/repositories_notification.dart';
import '../datasources/notifications_remote_data_source.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationsRemoteSource remoteDataSource;
  final NetworkInfo networkInfo;

  NotificationRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<List<NotificationItemModel>> getNotifications(
          {required bool isRead}) =>
      remoteDataSource.getNotifications(isRead: isRead);
}
