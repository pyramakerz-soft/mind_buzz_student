import 'dart:developer';

import 'package:based_of_eng_game/based_of_eng_game.dart';

import '../../../../../core/apis_connections/api_connection.dart';
import '../../../../../core/connection.dart';

abstract class DataSourceRemotelyOfContactAssignment {
  Future<List<GameFinalModel>> assignmentContactDataRepository({required int programId, required int testId});
  Future<String> submitAssignmentContactDataRepository({required int testId, required int mistakeCount, required int stars});
}

class DataSourceRemotelyOfContactAssignmentImpl
    implements DataSourceRemotelyOfContactAssignment {
  final MainApiConnection dio;

  DataSourceRemotelyOfContactAssignmentImpl({required this.dio});

  @override
  Future<List<GameFinalModel>> assignmentContactDataRepository(
      {required int programId, required int testId}) async {
    final response = await dio.post(
        url: '${Connection.baseURL}${dio.studentAssignmentsGames}',
        queryParameters: {'program_id': programId, 'test_id': testId});
    if (dio.validResponse(response)) {
      final List<GameFinalModel> l = [];
      response.data['data'].forEach((e) => l.add(GameFinalModel.fromJson(e)));
      return l;
    } else {
      throw response.data['msg'];
    }
  }

  @override
  Future<String> submitAssignmentContactDataRepository({required int testId, required int mistakeCount, required int stars}) async {
    final response = await dio.post(
        url: '${Connection.baseURL}${dio.finishAssignment}',
        queryParameters: {'stars': stars, 'test_id': testId, 'mistake_count':mistakeCount});
    if (dio.validResponse(response)) {
      final List<GameFinalModel> l = [];
      response.data['data'].forEach((e) => l.add(GameFinalModel.fromJson(e)));
      return 'done';
    } else {
      throw response.data['msg'];
    }
  }
}
