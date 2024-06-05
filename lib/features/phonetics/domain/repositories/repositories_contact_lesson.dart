import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../entities/game_model.dart';

abstract class ProgramContactLessonRepository {
  Future<Either<Failure, List<GameModel>>> lessonContactDataRepository(
      {required int lessonId, required int gameId});
  Future<Either<Failure, List<GameModel>>> gameById({required int gameId});
}
