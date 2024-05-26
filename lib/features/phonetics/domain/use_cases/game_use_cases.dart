import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../entities/game_model.dart';
import '../repositories/repositories_contact_lesson.dart';

class GetGameUseCases {
  final ProgramContactLessonRepository repository;

  GetGameUseCases(this.repository);

  Future<Either<Failure, List<GameModel>>> call(
      {required int gameId}) async {
    return await repository.gameById(gameId: gameId);
  }
}
