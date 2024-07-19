import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mind_buzz_refactor/features/notification/domain/entities/notification_item_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/main_of_notifications_model.dart';
import '../../domain/repositories/repositories_notification.dart';
import '../datasources/notifications_remote_data_source.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationsRemoteSource remoteDataSource;
  final NetworkInfo networkInfo;

  NotificationRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, MainOfNotificationsModel>> getNotifications(
      {required bool isRead}) async {
    if (await networkInfo.isConnected) {
      try {
        final res = await remoteDataSource.getNotifications(isRead: isRead);
        log('res:${res.notifications?.length}');
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
}
