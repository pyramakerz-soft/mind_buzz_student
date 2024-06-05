import 'dart:developer';

import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import '../../domain/entities/lesson_model.dart';

abstract class DataSourceRemotelyOfLesson {
  Future<List<LessonModel>> getUnitDataRemotely({required int programId});
  Future<bool> sendStarToGame(
      {required List<int> gameId, required int countOfStars});
  Future<bool> sendStarToGameFromLocal(
      {required List<int> gameId, required List countOfStars});
}

class DataSourceRemotelyOfLessonImpl implements DataSourceRemotelyOfLesson {
  final MainApiConnection dio;

  DataSourceRemotelyOfLessonImpl({required this.dio});

  @override
  Future<List<LessonModel>> getUnitDataRemotely(
      {required int programId}) async {
    log('getUnitDataRemotely');
    final response = await dio.get(
      url:
          '${Connection.baseURL}${dio.getLessonsOfProgramsEndPoint}/$programId',
    );
    if (dio.validResponse(response)) {
      final List<LessonModel> l = [];
      response.data['data'].forEach((e) {
        l.add(LessonModel.fromJson(e));
      });
      return l;
    } else {
      throw response.data['msg'];
    }
  }

  @override
  Future<bool> sendStarToGame(
      {required List<int> gameId, required int countOfStars}) async {
    final response = await dio.post(
        url: '${Connection.baseURL}${dio.sendSolveData}',
        queryParameters: {'game_id[]': gameId, 'stars': countOfStars});
    if (dio.validResponse(response)) {
      return true;
    } else {
      throw false;
    }
  }

  @override
  Future<bool> sendStarToGameFromLocal(
      {required List<int> gameId, required List countOfStars}) async {
    print('sendStarToGameFromLocal');
    for (int i = 0; i < gameId.length; i++) {
      try {
        await dio.post(
            url: '${Connection.baseURL}${dio.sendSolveData}',
            queryParameters: {
              'game_id[]': gameId[i],
              'stars': countOfStars[i]
            });
      } catch (e) {
        return false;
      }
    }

    return true;
  }
}
