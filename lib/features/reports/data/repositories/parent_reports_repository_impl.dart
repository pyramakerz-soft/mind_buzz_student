import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mind_buzz_refactor/features/student_assignment/domain/entities/main_data_test.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/repository_parent_reports.dart';
import '../data_sources/data_source_remotely_of_parent_reports.dart';

class ParentReportsRepositoryImpl implements ParentReportsRepository {
  final DataSourceRemotelyOfParentReports remoteDataSource;
  final NetworkInfo networkInfo;

  ParentReportsRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, MainDataTestsModel>> reportsDataRepository(
      {String? fromDate, String? toDate, String? selectedType}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getParentReportsDataReports(
            fromDate: fromDate, toDate: toDate, selectedType: selectedType);
        return Right(res);
      } on DioException catch (e, s) {
        log('e.response:${e.response?.statusMessage}');
        if (e.response?.statusMessage == 'Unauthorized') {
          return Left(ReLoginFailure());
        }
        return Left(LoginFailure());
      } catch (e, s) {
        log('error-:${e.toString()}');
        log('error:${e.runtimeType}');
        return Left(LoginFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }
}
