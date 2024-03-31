import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/unit_model.dart';
import '../repositories/repositories_unit.dart';

class UnitUseCases {
  final ProgramUnitRepository repository;

  UnitUseCases(this.repository);

  Future<Either<Failure, List<UnitModel>>> call({required int programId}) async {
    return await repository.unitDataRepository(programId:programId);
  }
}