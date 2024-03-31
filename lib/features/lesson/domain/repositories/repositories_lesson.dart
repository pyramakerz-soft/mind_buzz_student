import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/lesson_model.dart';

abstract class ProgramLessonRepository {
  Future<Either<Failure, List<LessonModel>>> lessonDataRepository({required int programId});
}