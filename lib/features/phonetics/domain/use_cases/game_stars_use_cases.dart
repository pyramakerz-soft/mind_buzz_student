import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../entities/game_model.dart';
import '../repositories/repositories_contact_lesson.dart';

class GameStarsUseCases {
  final ProgramContactLessonRepository repository;

  GameStarsUseCases(this.repository);

  Future<bool> call(
      {required List<int> gameId, required int countOfStars}) async {
    return await repository.sendStarToGame(gameId: gameId, countOfStars:countOfStars);
  }
}
