import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_courses.dart';

abstract class ProgramRepository {
  Future<Either<Failure, List<UserCourseModel>>> programDataRepository();
  Future<Either<Failure, Unit>> logOutDataRepository();
}
