// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mind_buzz_refactor/core/apis_connections/api_connection.dart';
import 'package:mind_buzz_refactor/core/connection.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/pie_chart_model.dart';

abstract class PieChartRemoteDataSource {
  Future<PieChartModel?> getAssignments({int? programId, String? status});
}

class PieChartRemoteDataSourceImpl implements PieChartRemoteDataSource {
  final MainApiConnection dio;
  PieChartRemoteDataSourceImpl({
    required this.dio,
  });

  @override
  Future<PieChartModel?> getAssignments(
      {int? programId, String? status}) async {
    Map<String, dynamic>? formData = {
      'program_id': programId,
      'status': status,
    };
    final response = await dio.post(
        url: '${Connection.baseURL}${dio.getStudentProgramsTestEndPoint}',
        queryParameters: formData);
    if (dio.validResponse(response)) {
      return PieChartModel.fromJson(response.data['data']);
    } else {
      throw response.data['msg'];
    }
  }
}
