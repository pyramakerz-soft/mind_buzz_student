import 'package:dio/dio.dart';

import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import '../../../student_assignment/domain/entities/main_data_test.dart';

abstract class DataSourceRemotelyOfParentReports {
  Future<MainDataTestsModel> getParentReportsDataReports(
      {String? date, String? selectedType});
}

class DataSourceRemotelyOfParentReportsImpl
    implements DataSourceRemotelyOfParentReports {
  final MainApiConnection dio;

  DataSourceRemotelyOfParentReportsImpl({required this.dio});

  @override
  Future<MainDataTestsModel> getParentReportsDataReports(
      {String? date, String? selectedType}) async {
    final response = await dio.post(
        url: '${Connection.baseURL}${dio.getStudentReportsTestEndPoint}',
        queryParameters: {
          if (date != null) 'date': date,
          if (selectedType != null) 'types': selectedType
        });
    if (dio.validResponse(response)) {
      return MainDataTestsModel.fromJson(response.data['data']);
    } else {
      throw response.data['msg'];
    }
  }
}
