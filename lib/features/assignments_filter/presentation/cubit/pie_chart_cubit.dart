import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/use_cases/pie_chart_use_cases.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/presentation/cubit/pie_chart_state.dart';

class PieChartCubit extends Cubit<PieChartState> {
  PieChartCubit(this._pieChartUseCases)
      : super(PieChartState(status: PieChartStateStatus.initial));
  final PieChartUseCases _pieChartUseCases;
  Future<void> getAssignments({int? programId, String? status}) async {
    emit(state.copyWith(status: PieChartStateStatus.loading));
    try {
      final pieChartModel =
          await _pieChartUseCases.call(programId: programId, status: status);
      emit(state.copyWith(
        status: PieChartStateStatus.loaded,
        counts: pieChartModel?.counts,
        percentages: pieChartModel?.percentages,
        courses: pieChartModel?.courses,
        tests: pieChartModel?.tests,
      ));
    } catch (e) {
      emit(state.copyWith(
          status: PieChartStateStatus.error,
          message: e is DioException ? 'Server Error' : e.toString()));
    }
  }

  Future<void> changeStatus(String? status) async {
    final isTheSame = state.sectionName == status;
    await getAssignments(status: isTheSame ? null : status);
    emit(state.copyWith(sectionName: () => isTheSame ? null : status));
  }

  Future<void> changeProgram(int? programId) =>
      getAssignments(programId: programId);
  Future<void> resetStatus() => getAssignments();
}
