import 'package:dartz/dartz.dart';
import 'package:mind_buzz_refactor/core/error/failures.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/pie_chart_model.dart';

abstract class PieChartRepository {
  Future<PieChartModel?> getAssignments({int? programId, String? status});
  Future<PieChartModel?> getReports(
      {required int programId, String? startDate, String? endDate, int? stars});
}
