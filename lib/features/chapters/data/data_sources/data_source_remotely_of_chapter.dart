import 'dart:developer';

import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import '../../domain/entities/lesson_model.dart';

abstract class DataSourceRemotelyOfLesson {
  Future<List<LessonModel>> getUnitDataRemotely({required int programId});
}


class DataSourceRemotelyOfLessonImpl implements DataSourceRemotelyOfLesson {
  final MainApiConnection dio;

  DataSourceRemotelyOfLessonImpl({required this.dio});

  @override
  Future<List<LessonModel>> getUnitDataRemotely({required int programId}) async {
log('getUnitDataRemotely');
    final response = await dio.get(
      url: '${Connection.baseURL}${dio.getLessonsOfProgramsEndPoint}/$programId',

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


}
