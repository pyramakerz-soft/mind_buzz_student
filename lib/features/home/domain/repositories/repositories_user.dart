import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/program_model.dart';

abstract class ProgramRepository {
  Future<Either<Failure, List<ProgramModel>>> programDataRepository();
}