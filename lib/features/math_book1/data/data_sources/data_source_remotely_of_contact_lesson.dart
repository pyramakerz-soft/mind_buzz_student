import 'dart:developer';

import '../../../../../core/apis_connections/api_connection.dart';
import '../../../../../core/connection.dart';
import '../../domain/entities/contact_of_lesson.dart';
import '../../domain/entities/lesson_questions.dart';

abstract class DataSourceRemotelyOfContactLesson {
  Future<List<LessonQuestionsModel>> getContactLessonDataRemotely(
      {required int programId});
}

class DataSourceRemotelyOfContactLessonImpl
    implements DataSourceRemotelyOfContactLesson {
  final MainApiConnection dio;

  DataSourceRemotelyOfContactLessonImpl({required this.dio});

  @override
  Future<List<LessonQuestionsModel>> getContactLessonDataRemotely(
      {required int programId}) async {
    final response = await dio.get(
      url: '${Connection.baseURL}${dio.getLessonQuestionsEndPoint}/$programId',
    );
    if (dio.validResponse(response)) {
      final List<LessonQuestionsModel> l = [];
      response.data['data']['questions']
          .forEach((e) => l.add(LessonQuestionsModel.fromJson(e)));
      return l;
    } else {
      throw response.data['msg'];
    }
  }
}
