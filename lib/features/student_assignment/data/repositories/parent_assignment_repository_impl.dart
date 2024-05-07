import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mind_buzz_refactor/features/student_assignment/domain/entities/main_data_test.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/repository_student_assignment.dart';
import '../datasources/data_source_remotely_of_home.dart';

class ParentAssignmentRepositoryImpl implements ParentAssignmentRepository {
  final DataSourceRemotelyOfParentAssignment remoteDataSource;
  final NetworkInfo networkInfo;

  ParentAssignmentRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, MainDataTestsModel>> assignmentDataRepository({required int idProgram}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getParentAssignmentDataAssignment(programId:idProgram);
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
