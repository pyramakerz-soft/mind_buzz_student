import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_data_model.dart';
import '../repositories/repositories_user.dart';

class UserUseCases {
  final LoginRepository repository;

  UserUseCases(this.repository);

  Future<Either<Failure, UserData>> call({required String email,required String password}) async {
    return await repository.getLoginDataRepository(password:password, email: email);
  }
}