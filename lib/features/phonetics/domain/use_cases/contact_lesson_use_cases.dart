import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../entities/game_model.dart';
import '../repositories/repositories_contact_lesson.dart';

class ContactLessonUseCases {
  final ProgramContactLessonRepository repository;

  ContactLessonUseCases(this.repository);

  Future<Either<Failure, List<GameModel>>> call(
      {required int programId}) async {
    return await repository.lessonContactDataRepository(programId: programId);
  }
}
