import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/unit_model.dart';

abstract class ProgramUnitRepository {
  Future<Either<Failure, List<UnitModel>>> unitDataRepository({required int programId});
}