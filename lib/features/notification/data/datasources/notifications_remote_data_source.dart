import 'package:mind_buzz_refactor/core/connection.dart';
import 'package:mind_buzz_refactor/features/notification/domain/entities/notification_item_model.dart';

import '../../../../core/apis_connections/api_connection.dart';
import '../../domain/entities/main_of_notifications_model.dart';

abstract class NotificationsRemoteSource {
  Future<MainOfNotificationsModel> getNotifications({required bool isRead});
}

class NotificationsRemoteSourceImpl implements NotificationsRemoteSource {
  final MainApiConnection dio;

  NotificationsRemoteSourceImpl({required this.dio});

  @override
  Future<MainOfNotificationsModel> getNotifications(
      {required bool isRead}) async {
    final formData = {
      'is_read': isRead == true ? 1 : 0,
    };
    final response = await dio.post(
        url: '${Connection.baseURL}${dio.getNotifications}',
        queryParameters: formData);
    if (dio.validResponse(response)) {
      return MainOfNotificationsModel.fromJson(response.data['data']);
    } else {
      throw response.data['msg'];
    }
  }
}
