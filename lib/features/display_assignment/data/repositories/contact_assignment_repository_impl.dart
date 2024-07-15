import 'dart:developer';
import 'package:based_of_eng_game/based_of_eng_game.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/repositories/repositories_contact_assignment.dart';
import '../data_sources/data_source_remotely_of_contact_assignment.dart';

class ContactAssignmentRepositoryImpl
    implements ProgramContactAssignmentRepository {
  final DataSourceRemotelyOfContactAssignment remoteDataSource;

  final NetworkInfo networkInfo;

  ContactAssignmentRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<GameFinalModel>>> assignmentContactDataRepository(
      {required int programId, required int testId}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.assignmentContactDataRepository(
            programId: programId, testId: testId);
        // final res = await localRemoteDataSource.getContactLessonDataRemotely(programId: programId);
        log('res:$res');
        return Right(res);
      } catch (e, s) {
        log('error:${e.toString()}');
        log('error:${e.runtimeType}');
        return Left(LoginFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, String>> submitAssignmentContactDataRepository(
      {required int testId,
      required int mistakeCount,
      required int stars}) async {
    if (await networkInfo.isConnected) {
      try {
        final res =
            await remoteDataSource.submitAssignmentContactDataRepository(
                testId: testId, mistakeCount: mistakeCount, stars: stars);
        // final res = await localRemoteDataSource.getContactLessonDataRemotely(programId: programId);
        log('res:$res');
        return Right(res);
      } catch (e, s) {
        log('error:${e.toString()}');
        log('error:${e.runtimeType}');
        return Left(LoginFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }
}
