import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_data_model.dart';
import '../repositories/repositories_user.dart';

class AutoUserUseCases {
  final LoginRepository repository;

  AutoUserUseCases(this.repository);

  Future<Either<Failure, UserData>> call() async {
    return await repository.getAutoLogin();
  }
}