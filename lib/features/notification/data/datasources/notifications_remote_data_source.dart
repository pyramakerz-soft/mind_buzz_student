import 'package:mind_buzz_refactor/core/connection.dart';
import 'package:mind_buzz_refactor/features/notification/domain/entities/notification_item_model.dart';

import '../../../../core/apis_connections/api_connection.dart';

abstract class NotificationsRemoteSource {
  Future<List<NotificationItemModel>> getNotifications({required bool isRead});
}

class NotificationsRemoteSourceImpl implements NotificationsRemoteSource {
  final MainApiConnection dio;

  NotificationsRemoteSourceImpl({required this.dio});

  @override
  Future<List<NotificationItemModel>> getNotifications(
      {required bool isRead}) async {
    final formData = {
      'is_read': isRead == true ? 1 : 0,
    };
    final response = await dio.post(
        url: '${Connection.baseURL}${dio.getNotifications}',
        queryParameters: formData);
    if (dio.validResponse(response)) {
      if (response.data['data'] == null) return [];
      return response.data['data']
          .map<NotificationItemModel>((x) => NotificationItemModel.fromJson(x))
          .toList();
    } else {
      throw response.data['msg'];
    }
  }
}
