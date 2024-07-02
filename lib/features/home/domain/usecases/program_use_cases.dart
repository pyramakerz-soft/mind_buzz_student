import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_courses.dart';
import '../repositories/repositories_user.dart';

class ProgramUserUseCases {
  final ProgramRepository repository;

  ProgramUserUseCases(this.repository);

  Future<Either<Failure, List<UserCourseModel>>> call() async {
    return await repository.programDataRepository();
  }
}
