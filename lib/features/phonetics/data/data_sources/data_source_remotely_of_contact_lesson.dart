import 'dart:developer';

import '../../../../../core/apis_connections/api_connection.dart';
import '../../../../../core/connection.dart';
import '../../domain/entities/game_model.dart';

abstract class DataSourceRemotelyOfContactLesson {
  Future<List<GameModel>> getContactLessonDataRemotely(
      {required int lessonId, required int gameId});
  Future<List<GameModel>> getGameById({required int gameId});
}

class DataSourceRemotelyOfContactLessonImpl
    implements DataSourceRemotelyOfContactLesson {
  final MainApiConnection dio;

  DataSourceRemotelyOfContactLessonImpl({required this.dio});

  @override
  Future<List<GameModel>> getContactLessonDataRemotely(
      {required int lessonId, required int gameId}) async {
    final response = await dio.post(
        url: '${Connection.baseURL}${dio.getGameById}',
        queryParameters: {'lesson_id': lessonId, 'game_id': gameId});
    if (dio.validResponse(response)) {
      final List<GameModel> l = [];
      response.data['data']['games']
          .forEach((e) => l.add(GameModel.fromJson(e)));
      return l;
    } else {
      throw response.data['msg'];
    }
  }

  @override
  Future<List<GameModel>> getGameById({required int gameId}) async {
    final response = await dio.post(
        url: '${Connection.baseURL}${dio.getGameById}',
        queryParameters: {'game_id': gameId});
    if (dio.validResponse(response)) {
      final List<GameModel> l = [];
      response.data['data']['games']
          .forEach((e) => l.add(GameModel.fromJson(e)));
      return l;
    } else {
      throw response.data['msg'];
    }
  }
}
