import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/entities/game_model.dart';
import '../../domain/repositories/repositories_contact_lesson.dart';
import '../data_sources/data_source_remotely_of_contact_lesson.dart';
import '../../../math_book1/data/data_sources/local_data_source_remotely_of_contact_lesson.dart';

class ContactLessonRepositoryImpl implements ProgramContactLessonRepository {
  final DataSourceRemotelyOfContactLesson remoteDataSource;
  // final LocalDataSourceRemotelyOfContactLesson localRemoteDataSource;

  final NetworkInfo networkInfo;

  ContactLessonRepositoryImpl(
      {required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<GameModel>>>
      lessonContactDataRepository({required int programId}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getContactLessonDataRemotely(
            programId: programId);
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
  Future<Either<Failure, List<GameModel>>>
  gameById({required int gameId}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getGameById(
            gameId: gameId);
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
