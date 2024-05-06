
import '../../../../core/apis_connections/api_connection.dart';


abstract class DataSourceRemotelyOfCalender {

}


class DataSourceRemotelyOfCalenderImpl implements DataSourceRemotelyOfCalender {
  final MainApiConnection dio;

  DataSourceRemotelyOfCalenderImpl({required this.dio});


}
