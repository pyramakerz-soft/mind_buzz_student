import 'dart:developer';

import 'package:dartz/dartz.dart';

import 'package:mind_buzz_refactor/core/error/failures.dart';

import 'package:mind_buzz_refactor/features/intro_page/domain/entities/based_game_model.dart';

import '../../../../core/network/network_info.dart';
import '../../domain/repositories/repositories_game.dart';
import '../datasources/data_source_local_of_game.dart';
import '../datasources/data_source_remotely_of_game.dart';

class GameRepositoryImpl implements GameRepository {
  final DataSourceRemotelyOfGame remoteDataSource;
  final DataSourceLocalOfGame localDataSource;
  final NetworkInfo networkInfo;

  GameRepositoryImpl(
      this.remoteDataSource, this.localDataSource, this.networkInfo);
  @override
  Future<Either<Failure, BasedGameModel>> getGameDataRepository(
      {required int index, bool? showLocal}) async {
    if (showLocal == true) {
      return Right(await localDataSource.getGameDataLocal());
    }
    if (await networkInfo.isConnected) {
      try {
        return Right(await remoteDataSource.getGameDataRemotely(
            index: index.toString()));
      } catch (e) {
        log('error:$e');
        return Left(CacheFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }
}
