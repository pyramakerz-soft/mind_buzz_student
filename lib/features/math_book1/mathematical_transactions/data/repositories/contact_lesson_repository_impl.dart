import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:mind_buzz_refactor/features/math_book1/mathematical_transactions/domain/entities/contact_of_lesson.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/network/network_info.dart';
import '../../domain/repositories/repositories_contact_lesson.dart';
import '../data_sources/data_source_remotely_of_contact_lesson.dart';

class ContactLessonRepositoryImpl implements ProgramContactLessonRepository {
  final DataSourceRemotelyOfContactLesson remoteDataSource;
  final NetworkInfo networkInfo;

  ContactLessonRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<ContactOfLessonModel>>> lessonContactDataRepository({required int programId}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getContactLessonDataRemotely(programId: programId);
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

}
