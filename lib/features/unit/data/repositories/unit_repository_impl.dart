import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/unit_model.dart';
import '../../domain/repositories/repositories_unit.dart';
import '../data_sources/data_source_remotely_of_unit.dart';

class UnitRepositoryImpl implements ProgramUnitRepository {
  final DataSourceRemotelyOfUnit remoteDataSource;
  final NetworkInfo networkInfo;

  UnitRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});


  @override
  Future<Either<Failure, List<UnitModel>>> unitDataRepository({required int programId}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getUnitDataRemotely(programId: programId);
        log('res:$res');
        return Right(res);
      }on DioException catch (e, s) {
        log('e.response:${e.response?.statusMessage}');
        if (e.response?.statusMessage == 'Unauthorized') {
          return Left(ReLoginFailure());
        }
        return Left(LoginFailure());
      } catch (e, s) {

        log('error:${e.toString()}');
        log('error:${e.runtimeType}');
        return Left(LoginFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

}
