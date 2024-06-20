import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import 'package:games_models/games_models.dart';

abstract class ProgramLessonRepository {
  Future<Either<Failure, List<LessonModel>>> lessonDataRepository(
      {required int programId});
  Future<bool> sendStarToGame(
      {required List<int> gameId, required int countOfStars});
  Future<bool> sendStarToGameFromLocal(
      {required List<int> gameId, required List countOfStars});
  Future<void> saveStarInLocal(
      {required List<int> gameId, required int countOfStars});
  Future<void> clearStarInLocal();
  Future<List<GameModel>> getCountStarInLocal();
  Future<bool> checkStateOfSendData();
}
