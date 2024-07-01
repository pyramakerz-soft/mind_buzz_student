import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/pie_chart_model.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/repository/pie_chart_repository.dart';

class GetAssignmentsPieChartUseCase {
  final PieChartRepository _repository;

  GetAssignmentsPieChartUseCase(this._repository);

  Future<PieChartModel?> call({int? programId, String? status}) {
    return _repository.getAssignments(programId: programId, status: status);
  }
}
