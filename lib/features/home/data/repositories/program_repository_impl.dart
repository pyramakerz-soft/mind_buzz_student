import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/units_model.dart';
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
  Future<Either<Failure, List<UnitsModel>>> lessonsDataRepository({required int programId}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getLessonsDataRemotely(programId: programId);
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
  Future<Either<Failure, Unit>> logOutDataRepository() async {
    await remoteDataSource.logOutDataRemotely();
    return const Right(unit);
  }
}
