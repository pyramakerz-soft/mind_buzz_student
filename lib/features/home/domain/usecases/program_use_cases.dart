import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/program_model.dart';
import '../repositories/repositories_user.dart';

class ProgramUserUseCases {
  final ProgramRepository repository;

  ProgramUserUseCases(this.repository);

  Future<Either<Failure, List<ProgramModel>>> call() async {
    return await repository.programDataRepository();
  }
}