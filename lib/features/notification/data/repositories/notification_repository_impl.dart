import '../../../../core/network/network_info.dart';
import '../../domain/repositories/repositories_notification.dart';
import '../datasources/data_source_remotely_of_notification.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final DataSourceRemotelyOfNotification remoteDataSource;
  final NetworkInfo networkInfo;

  NotificationRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

}
