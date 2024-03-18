import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/units_model.dart';
import '../entities/user_courses.dart';
import '../repositories/repositories_user.dart';

class LessonsUseCases {
  final ProgramRepository repository;

  LessonsUseCases(this.repository);

  Future<Either<Failure, List<UnitsModel>>> call({required int programId}) async {
    return await repository.lessonsDataRepository(programId:programId);
  }
}