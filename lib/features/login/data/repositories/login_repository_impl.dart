import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user_data_model.dart';
import '../../domain/repositories/repositories_user.dart';
import '../datasources/data_source_remotely_of_game.dart';

class LoginRepositoryImpl implements LoginRepository {
  final DataSourceRemotelyOfLogin remoteDataSource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, UserData>> getLoginDataRepository(
      {required String email, required String password}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getLoginDataRemotely(
            email: email, password: password);
        log('res:$res');
        return Right(res);
      } catch (e, s) {
        return Left(ServerFailure(message: "${jsonDecode(e.toString())['message']}"));
      }
    } else {
      return Left(CacheFailure());
    }
  }
  @override
  Future<Either<Failure, UserData>> getAutoLogin() async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getAutoLogin();
        log('res:$res');
        return Right(res);
      } catch (e, s) {
        try {
          return Left(
              ServerFailure(message: "${jsonDecode(e.toString())['message']}"));
        }catch(e){
          log('error:$e');
          return Left(
              CacheFailure());
        }
      }
    } else {
      return Left(CacheFailure());
    }
  }
}
