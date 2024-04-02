import 'package:dartz/dartz.dart';
import '../../../../../core/error/failures.dart';
import '../entities/contact_of_lesson.dart';

abstract class ProgramContactLessonRepository {
  Future<Either<Failure, List<ContactOfLessonModel>>> lessonContactDataRepository({required int programId});
}