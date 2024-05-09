import 'package:dio/dio.dart';

import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import '../../../student_assignment/domain/entities/main_data_test.dart';

abstract class DataSourceRemotelyOfParentReports {
  Future<MainDataTestsModel> getParentReportsDataReports(
      { String? date});
}

class DataSourceRemotelyOfParentReportsImpl implements DataSourceRemotelyOfParentReports {
  final MainApiConnection dio;

  DataSourceRemotelyOfParentReportsImpl({required this.dio});

  @override
  Future<MainDataTestsModel> getParentReportsDataReports({String? date}) async {
    Map<String, dynamic>? formData = {
      // 'program_id':programId,
      // if(fromDate!=null)'from_date':fromDate,
      // if(toDate!=null)'to_date':toDate,
      // if(status!=null)'status':status,
    };
    // formData.addAll(subListOfTypes);
    final response = await dio.post(
        url:
        '${Connection.baseURL}${dio.getStudentProgramsTestEndPoint}',
        queryParameters: formData
    );
    if (dio.validResponse(response)) {
      return MainDataTestsModel.fromJson(response.data['data']);
    } else {
      throw response.data['msg'];
    }
  }

}
