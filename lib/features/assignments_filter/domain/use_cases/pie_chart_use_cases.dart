import 'package:dartz/dartz.dart';
import 'package:mind_buzz_refactor/core/error/failures.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/pie_chart_model.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/repository/pie_chart_repository.dart';

class PieChartUseCases {
  final PieChartRepository _repository;

  PieChartUseCases(this._repository);

  Future<PieChartModel?> call({int? programId, String? status}) async {
    return await _repository.getAssignments(
        programId: programId, status: status);
  }
}
