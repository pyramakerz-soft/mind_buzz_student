import 'dart:developer';

import '../../../../../core/apis_connections/api_connection.dart';
import '../../../../../core/connection.dart';
import '../../domain/entities/game_model.dart';

abstract class DataSourceRemotelyOfContactLesson {
  Future<List<GameModel>> getContactLessonDataRemotely(
      {required int programId});
}

class DataSourceRemotelyOfContactLessonImpl
    implements DataSourceRemotelyOfContactLesson {
  final MainApiConnection dio;

  DataSourceRemotelyOfContactLessonImpl({required this.dio});

  @override
  Future<List<GameModel>> getContactLessonDataRemotely(
      {required int programId}) async {
    final response = await dio.get(
      url: '${Connection.baseURL}${dio.getLessonQuestionsEndPoint}/$programId',
    );
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
