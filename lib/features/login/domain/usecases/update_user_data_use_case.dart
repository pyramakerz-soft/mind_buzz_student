import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_data_model.dart';
import '../repositories/repositories_user.dart';

class UpdateUserDataUseCases {
  final LoginRepository repository;

  UpdateUserDataUseCases(this.repository);

  Future<Either<Failure, UserData>> call(
      {String? name,
      String? email,
      String? phone,
      String? countryCode,
      File? filepath}) async {
    return await repository.updateUserDataRepository(
        name: name,
        email: email,
        phone: phone,
        countryCode: countryCode,
        filepath: filepath);
  }
}
