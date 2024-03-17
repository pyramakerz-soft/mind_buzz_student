import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:mind_buzz_refactor/features/login/domain/entities/user_data_model.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../login/domain/repositories/repositories_user.dart';
import '../../domain/entities/program_model.dart';
import '../../domain/repositories/repositories_user.dart';
import '../datasources/data_source_remotely_of_home.dart';

class LoginRepositoryImpl implements LoginRepository {
  final DataSourceRemotelyOfPrograme remoteDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, ProgramModel>> getStoresDataRepository(
      {required String email, required String password})  async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getLoginDataRemotely(
            email: email, password: password);
        log('res:$res');
        return Right(res);
      } catch (e, s) {

        log('error:${e.toString()}');
        log('error:${e.runtimeType}');
        return Left(LoginFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, UserData>> getLoginDataRepository({required String email, required String password}) {
    // TODO: implement getLoginDataRepository
    throw UnimplementedError();
  }
}
