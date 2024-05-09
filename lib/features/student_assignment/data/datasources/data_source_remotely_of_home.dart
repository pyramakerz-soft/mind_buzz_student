import 'package:dio/dio.dart';

import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import '../../domain/entities/main_data_test.dart';

abstract class DataSourceRemotelyOfParentAssignment {
  Future<MainDataTestsModel> getParentAssignmentDataAssignment(
      { int? programId, String? fromDate, String? toDate, String? status, List<String>? listOfTypes});
}

class DataSourceRemotelyOfParentAssignmentImpl implements DataSourceRemotelyOfParentAssignment {
  final MainApiConnection dio;

  DataSourceRemotelyOfParentAssignmentImpl({required this.dio});

  @override
  Future<MainDataTestsModel> getParentAssignmentDataAssignment(
      { int? programId, String? fromDate, String? toDate, String? status, List<String>? listOfTypes}) async {
    Map<String, String> subListOfTypes = {};
    if (listOfTypes!=null && listOfTypes.isNotEmpty)
      for (int i = 0; i < listOfTypes.length; i++) {
        subListOfTypes.addAll({'types[$i]': listOfTypes[i]});
      }
    Map<String, dynamic>? formData = {
      'program_id':programId,
      if(fromDate!=null)'from_date':fromDate,
      if(toDate!=null)'to_date':toDate,
      if(status!=null)'status':status,
    };
    formData.addAll(subListOfTypes);
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
