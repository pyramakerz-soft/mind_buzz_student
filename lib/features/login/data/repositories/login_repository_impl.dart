import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/based_login_model.dart';
import '../../domain/repositories/repositories_user.dart';
import '../datasources/data_source_remotely_of_game.dart';

class LoginRepositoryImpl implements LoginRepository {
  final DataSourceRemotelyOfLogin remoteDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(
      {required this.remoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, BasedLoginModel>> getLoginDataRepository({required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getLoginDataRemotely(
            email: email, password: password));
    } catch (e) {
    log('error:$e');
    return Left(CacheFailure());
    }
    } else {
    return Left(ServerFailure());
    }
  }
}
