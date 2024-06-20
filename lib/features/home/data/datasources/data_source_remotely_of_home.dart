
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import 'package:games_models/games_models.dart';

abstract class DataSourceRemotelyOfProgram {
  Future<List<UserCourseModel>> getProgramDataRemotely();
  Future logOutDataRemotely();
}


class DataSourceRemotelyOfProgramImpl implements DataSourceRemotelyOfProgram {
  final MainApiConnection dio;

  DataSourceRemotelyOfProgramImpl({required this.dio});

  @override
  Future<List<UserCourseModel>> getProgramDataRemotely() async {

    final response = await dio.get(
      url: '${Connection.baseURL}${dio.getStudentProgramsEndPoint}',

    );
    if (dio.validResponse(response)) {
      final List<UserCourseModel> l = [];
      response.data['data']['programs']['user_courses'].forEach((e) => l.add(UserCourseModel.fromJson(e)));
      return l;
    } else {
      throw response.data['msg'];
    }
  }

  @override
  Future logOutDataRemotely() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
