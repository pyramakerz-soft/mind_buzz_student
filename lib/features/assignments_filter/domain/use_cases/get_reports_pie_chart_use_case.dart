import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/pie_chart_model.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/repository/pie_chart_repository.dart';

class GetReportsPieChartUseCase {
  final PieChartRepository _repository;

  GetReportsPieChartUseCase(this._repository);

  Future<PieChartModel?> call(
      {required int programId,
      String? startDate,
      String? endDate,
      int? stars}) {
    return _repository.getReports(
        programId: programId,
        startDate: startDate,
        endDate: endDate,
        stars: stars);
  }
}
