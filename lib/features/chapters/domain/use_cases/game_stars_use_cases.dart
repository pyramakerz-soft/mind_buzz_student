import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../../../phonetics/domain/repositories/repositories_contact_lesson.dart';
import '../repositories/repositories_chapter.dart';

class GameStarsUseCases {
  final ProgramLessonRepository repository;

  GameStarsUseCases(this.repository);

  Future<bool> call(
      {required List<int> gameId, required int countOfStars}) async {
    return await repository.sendStarToGame(
        gameId: gameId, countOfStars: countOfStars);
  }
}
