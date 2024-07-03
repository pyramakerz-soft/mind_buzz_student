import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/use_cases/get_assignments_pie_chart_use_case.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/use_cases/get_reports_pie_chart_use_case.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/presentation/cubit/pie_chart_state.dart';

class PieChartCubit extends Cubit<PieChartState> {
  PieChartCubit(
      this._getAssignmentsPieChartUseCase, this._getReportsPieChartUseCase)
      : super(PieChartState(status: PieChartStateStatus.initial));
  final GetAssignmentsPieChartUseCase _getAssignmentsPieChartUseCase;
  final GetReportsPieChartUseCase _getReportsPieChartUseCase;
  Future<void> getAssignments({int? programId, String? status}) async {
    emit(state.copyWith(status: PieChartStateStatus.loading));
    try {
      final selectedProgramId = state.selectedProgram?.programId?.toInt();
      final selectedStatus = state.sectionName;

      final pieChartModel = await _getAssignmentsPieChartUseCase.call(
          programId: programId ?? selectedProgramId, status: selectedStatus);
      emit(state.copyWith(
        status: PieChartStateStatus.loaded,
        assignmentsPercentages: pieChartModel?.assignmentsPercentages,
        courses: pieChartModel?.courses,
        tests: pieChartModel?.tests,
      ));
    } catch (e) {
      emit(state.copyWith(
          status: PieChartStateStatus.error,
          message: e is DioException
              ? e.type == DioExceptionType.connectionError ||
                      e.type == DioExceptionType.connectionTimeout
                  ? "Check Your network"
                  : "Server Error"
              : e.toString()));
    }
  }

  void changeStatus(String? status) async {
    emit(state.copyWith(sectionName: () => status));
    getAssignments(status: status);
  }

  void changeProgram(int? programId) async {
    final selectedProgramId = state.selectedProgramId;
    final selectedCourse = state.courses
        .firstWhere((course) => course.programId?.toInt() == programId);
    emit(state.copyWith(
        selectedProgramId: selectedProgramId, selectedProgram: selectedCourse));
    getAssignments(programId: programId);
  }

  void resetStatus() {
    emit(state.copyWith(sectionName: () => null));
    getAssignments();
  }

  Future<void> getReports(
      {required int programId,
      String? startDate,
      String? endDate,
      int? stars}) async {
    emit(state.copyWith(status: PieChartStateStatus.loading));
    try {
      final selectedStars = state.numberOfStars;
      final startDate = state.startDate;
      final endDate = state.endDate;

      final pieChartModel = await _getReportsPieChartUseCase.call(
        programId: programId,
        startDate: startDate,
        endDate: endDate,
        stars: selectedStars,
      );
      emit(state.copyWith(
        status: PieChartStateStatus.loaded,
        reportsPercentages: pieChartModel?.reportsPercentages,
        progress: pieChartModel?.progress,
      ));
    } catch (e) {
      emit(state.copyWith(
          status: PieChartStateStatus.error,
          message: e is DioException
              ? e.type == DioExceptionType.connectionError ||
                      e.type == DioExceptionType.connectionTimeout
                  ? "Check Your network"
                  : "Server Error"
              : e.toString()));
    }
  }

  void changeStars(int programId, String? starsString) async {
    final stars = getNumberOfStars(starsString);
    emit(state.copyWith(
        numberOfStars: () => stars, sectionName: () => starsString));
    getReports(programId: programId, stars: stars);
  }

  void resetReports(int programId) {
    emit(state.copyWith(
      numberOfStars: () => null,
      startDate: () => null,
      endDate: () => null,
      sectionName: () => null,
    ));
    getReports(programId: programId);
  }

  void getReportsByDate(
      {required int programId,
      required String startDate,
      required String endDate}) {
    emit(state.copyWith(
      sectionName: () => null,
      numberOfStars: () => null,
      startDate: () => startDate,
      endDate: () => endDate,
    ));

    getReports(programId: programId, startDate: startDate, endDate: endDate);
  }

  int? getNumberOfStars(String? stars) {
    switch (stars) {
      case '1 Star':
        return 1;
      case '2 Stars':
        return 2;
      case '3 Stars':
        return 3;
      default:
        return null;
    }
  }
}
