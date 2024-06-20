import 'package:dartz/dartz.dart';
import 'package:games_models/games_models.dart';

import '../../../../core/error/failures.dart';

abstract class ProgramRepository {
  Future<Either<Failure, List<UserCourseModel>>> programDataRepository();
  Future<Either<Failure, Unit>> logOutDataRepository();
}