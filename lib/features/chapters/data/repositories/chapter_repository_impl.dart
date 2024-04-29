import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/lesson_model.dart';
import '../../domain/repositories/repositories_chapter.dart';
import '../data_sources/data_source_remotely_of_chapter.dart';

class LessonRepositoryImpl implements ProgramLessonRepository {
  final DataSourceRemotelyOfLesson remoteDataSource;
  final NetworkInfo networkInfo;

  LessonRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<LessonModel>>> lessonDataRepository({required int programId}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getUnitDataRemotely(programId: programId);
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
