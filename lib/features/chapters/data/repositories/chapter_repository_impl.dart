import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../phonetics/domain/entities/game_model.dart';
import '../../domain/entities/lesson_model.dart';
import '../../domain/repositories/repositories_chapter.dart';
import '../data_sources/data_source_local_of_game_star.dart';
import '../data_sources/data_source_remotely_of_chapter.dart';

class LessonRepositoryImpl implements ProgramLessonRepository {
  final DataSourceRemotelyOfLesson remoteDataSource;
  final DataSourceLocalOfContactLesson localRemoteDataSource;

  final NetworkInfo networkInfo;

  LessonRepositoryImpl(
      {required this.remoteDataSource,
      required this.networkInfo,
      required this.localRemoteDataSource});

  @override
  Future<Either<Failure, List<LessonModel>>> lessonDataRepository(
      {required int programId}) async {
    if (await networkInfo.isConnected) {
      try {
        await checkStateOfSendData();

        final res =
            await remoteDataSource.getUnitDataRemotely(programId: programId);
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
  Future<bool> sendStarToGame(
      {required List<int> gameId, required int countOfStars}) async {
    if (await networkInfo.isConnected) {
      try {
        await remoteDataSource.sendStarToGame(
            gameId: gameId, countOfStars: countOfStars);
        clearStarInLocal();
        return true;
      } catch (e, s) {}
    }
    saveStarInLocal(gameId: gameId, countOfStars: countOfStars);
    return false;
  }

  @override
  Future<void> saveStarInLocal(
      {required List<int> gameId, required int countOfStars}) async {
    await localRemoteDataSource.sendStarToGameLocal(
        gameId: gameId, countOfStars: countOfStars);
  }

  @override
  Future<void> clearStarInLocal() async {
    await localRemoteDataSource.clearStarInLocal();
  }

  @override
  Future<List<GameModel>> getCountStarInLocal() async {
    return await localRemoteDataSource.getCountStarInLocal();
  }

  @override
  Future<bool> checkStateOfSendData() async {
    List<GameModel> countOfDataForStars = await getCountStarInLocal();
    if (countOfDataForStars.isNotEmpty) {
      List<int> gamesId =
          countOfDataForStars.map((obj) => obj.id ?? 0).toList();
      List gamesStars = countOfDataForStars.map((obj) => obj.stars).toList();
      sendStarToGameFromLocal(gameId: gamesId, countOfStars: gamesStars);
    }
    return false;
  }

  @override
  Future<bool> sendStarToGameFromLocal(
      {required List<int> gameId, required List countOfStars}) async {
    await remoteDataSource.sendStarToGameFromLocal(
        gameId: gameId, countOfStars: countOfStars);
    clearStarInLocal();
    return true;
  }
}
