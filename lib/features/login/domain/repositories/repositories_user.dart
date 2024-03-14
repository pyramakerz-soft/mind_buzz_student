import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/based_login_model.dart';

abstract class LoginRepository {
  Future<Either<Failure, BasedLoginModel>> getLoginDataRepository({required String email,required String password});
}