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
    ContactOfLessonModel game1 = ContactOfLessonModel(firstNumber: 3, secondNumber: 2, numbersOfAnswers: const [2,3,5], correctAnswer:5, message: 'add then choose');
    ContactOfLessonModel game2 = ContactOfLessonModel(firstNumber: 4, secondNumber: 2, numbersOfAnswers: const [6,1,5], correctAnswer:6, message: 'add then choose');
    ContactOfLessonModel game3 = ContactOfLessonModel(firstNumber: 1, secondNumber: 1, numbersOfAnswers: const [2,3,4], correctAnswer:2, message: 'add then choose');
    return [game1, game2];
  }

}
