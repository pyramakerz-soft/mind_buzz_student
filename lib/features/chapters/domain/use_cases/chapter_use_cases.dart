import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import 'package:games_models/games_models.dart';
import '../repositories/repositories_chapter.dart';

class LessonUseCases {
  final ProgramLessonRepository repository;

  LessonUseCases(this.repository);

  Future<Either<Failure, List<LessonModel>>> call({required int programId}) async {
    return await repository.lessonDataRepository(programId:programId);
  }
}