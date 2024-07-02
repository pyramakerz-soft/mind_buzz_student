import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user_courses.dart';
import '../../domain/repositories/repositories_user.dart';
import '../datasources/data_source_remotely_of_home.dart';

class HomeRepositoryImpl implements ProgramRepository {
  final DataSourceRemotelyOfProgram remoteDataSource;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<UserCourseModel>>> programDataRepository() async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getProgramDataRemotely();
        log('res:$res');
        return Right(res);
      } on DioException catch (e, s) {
        log('e.response:${e.response?.statusMessage}');
        if (e.response?.statusMessage == 'Unauthorized') {
          return Left(ReLoginFailure());
        }
        return Left(LoginFailure());
      } catch (e, s) {
        log('error-:${e.toString()}');
        log('error:${e.runtimeType}');
        return Left(LoginFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> logOutDataRepository() async {
    await remoteDataSource.logOutDataRemotely();
    return const Right(unit);
  }
}
