import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_data_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserData>> getLoginDataRepository(
      {required String email, required String password});
  Future<Either<Failure, UserData>> getAutoLogin();
  Future<Either<Failure, bool>> createPassCode(String passCode);
  Future<Either<Failure, UserData>> updateUserDataRepository(
      {String? name, String? email, String? phone, File? filepath});
}
