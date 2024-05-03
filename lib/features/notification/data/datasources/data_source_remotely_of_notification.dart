
import '../../../../core/apis_connections/api_connection.dart';


abstract class DataSourceRemotelyOfNotification {

}


class DataSourceRemotelyOfNotificationImpl implements DataSourceRemotelyOfNotification {
  final MainApiConnection dio;

  DataSourceRemotelyOfNotificationImpl({required this.dio});


}
