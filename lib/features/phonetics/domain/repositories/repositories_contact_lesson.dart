import 'package:based_of_eng_game/based_of_eng_game.dart';
import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import 'package:games_models/games_models.dart';

abstract class ProgramContactLessonRepository {
  Future<Either<Failure, List<GameFinalModel>>> lessonContactDataRepository(
      {required int lessonId, required int gameId});
  Future<Either<Failure, List<GameModel>>> gameById({required int gameId});
}
