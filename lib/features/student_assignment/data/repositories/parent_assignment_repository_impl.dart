import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mind_buzz_refactor/features/student_assignment/domain/entities/main_data_test.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/repository_student_assignment.dart';
import '../datasources/data_source_remotely_of_parent_assignment.dart';

class ParentAssignmentRepositoryImpl implements ParentAssignmentRepository {
  final DataSourceRemotelyOfParentAssignment remoteDataSource;
  final NetworkInfo networkInfo;

  ParentAssignmentRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, MainDataTestsModel>> assignmentDataRepository(
      {int? idProgram,
      String? fromDate,
      String? toDate,
      String? status,
      List<String>? listOfTypes}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getParentAssignmentDataAssignment(
            programId: idProgram,
            fromDate: fromDate,
            toDate: toDate,
            status: status,
            listOfTypes: listOfTypes);
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
