import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../entities/contact_of_lesson.dart';
import '../entities/lesson_questions.dart';

abstract class ProgramContactLessonRepository {
  Future<Either<Failure, List<LessonQuestionsModel>>>
      lessonContactDataRepository({required int programId});
}
