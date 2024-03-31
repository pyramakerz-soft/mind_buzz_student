import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/lesson_model.dart';
import '../repositories/repositories_lesson.dart';

class LessonUseCases {
  final ProgramLessonRepository repository;

  LessonUseCases(this.repository);

  Future<Either<Failure, List<LessonModel>>> call({required int programId}) async {
    return await repository.lessonDataRepository(programId:programId);
  }
}