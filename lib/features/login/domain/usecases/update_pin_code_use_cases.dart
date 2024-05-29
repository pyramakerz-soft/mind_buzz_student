import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_data_model.dart';
import '../repositories/repositories_user.dart';

class CreatePassCodeUseCases {
  final LoginRepository repository;

  CreatePassCodeUseCases(this.repository);

  Future<Either<Failure, bool>> call(String pinCode) async {
    return await repository.createPassCode(pinCode);
  }
}