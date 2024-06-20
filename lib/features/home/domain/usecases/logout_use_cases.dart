import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../repositories/repositories_user.dart';

class LogOutUserUseCases {
  final ProgramRepository repository;

  LogOutUserUseCases(this.repository);

  Future<Either<Failure, Unit>> call() async {
    return await repository.logOutDataRepository();
  }
}