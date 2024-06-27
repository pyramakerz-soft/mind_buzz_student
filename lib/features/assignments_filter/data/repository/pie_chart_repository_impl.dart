// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mind_buzz_refactor/core/error/failures.dart';
import 'package:mind_buzz_refactor/core/network/network_info.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/data/datasource/pie_chart_remote_data_source.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/entities/pie_chart_model.dart';
import 'package:mind_buzz_refactor/features/assignments_filter/domain/repository/pie_chart_repository.dart';

class PieChartRepositoryImpl implements PieChartRepository {
  final PieChartRemoteDataSource _remoteDataSource;
  PieChartRepositoryImpl(this._remoteDataSource);

  @override
  Future<PieChartModel?> getAssignments({int? programId, String? status}) =>
      _remoteDataSource.getAssignments(
        programId: programId,
        status: status,
      );

  @override
  Future<PieChartModel?> getReports(
          {required int programId,
          String? startDate,
          String? endDate,
          int? stars}) =>
      _remoteDataSource.getReports(
          programId: programId,
          startDate: startDate,
          endDate: endDate,
          stars: stars);
}
