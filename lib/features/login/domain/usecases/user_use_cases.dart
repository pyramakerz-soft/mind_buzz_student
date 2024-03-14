import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/based_login_model.dart';
import '../repositories/repositories_user.dart';

class UserUseCases {
  final LoginRepository repository;

  UserUseCases(this.repository);

  Future<Either<Failure, BasedLoginModel>> call({required String email,required String password}) async {
    return await repository.getLoginDataRepository(password:password, email: email);
  }
}