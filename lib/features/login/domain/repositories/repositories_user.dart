import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/user_data_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, UserData>> getLoginDataRepository({required String email,required String password});
}