import 'dart:developer';

import '../../../../../core/apis_connections/api_connection.dart';
import '../../domain/entities/contact_of_lesson.dart';

abstract class DataSourceRemotelyOfContactLesson {
  Future<List<ContactOfLessonModel>> getContactLessonDataRemotely({required int programId});
}


class DataSourceRemotelyOfContactLessonImpl implements DataSourceRemotelyOfContactLesson {
  final MainApiConnection dio;

  DataSourceRemotelyOfContactLessonImpl({required this.dio});

  @override
  Future<List<ContactOfLessonModel>> getContactLessonDataRemotely({required int programId}) async {
    log('getContactLessonDataRemotely');
//     final response = await dio.get(
    //   url: '${Connection.baseURL}${dio.getLessonsOfProgramsEndPoint}/$programId',
    //
    // );
    // if (dio.validResponse(response)) {
    //   final List<LessonModel> l = [];
    //   response.data['data'].forEach((e) => l.add(LessonModel.fromJson(e)));
    //   return l;
    // } else {
    //   throw response.data['msg'];
    // }

    ContactOfLessonModel game1 = ContactOfLessonModel(firstNumber: 3, secondNumber: 2, numbersOfAnswers: const [2,3,5], correctAnswer:5, message: 'hello');
    ContactOfLessonModel game2 = ContactOfLessonModel(firstNumber: 4, secondNumber: 2, numbersOfAnswers: const [6,1,5], correctAnswer:6, message: 'hi');
    return [game1, game2];
  }

}
