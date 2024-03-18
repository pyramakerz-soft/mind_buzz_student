
import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import '../../domain/entities/units_model.dart';
import '../../domain/entities/user_courses.dart';

abstract class DataSourceRemotelyOfProgram {
  Future<List<UserCourseModel>> getProgramDataRemotely();
  Future<List<UnitsModel>> getLessonsDataRemotely({required int programId});
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
      response.data['data']['user_courses'].forEach((e) => l.add(UserCourseModel.fromJson(e)));
      return l;
    } else {
      throw response.data['msg'];
    }
  }

  @override
  Future<List<UnitsModel>> getLessonsDataRemotely({required int programId}) async {

    final response = await dio.get(
      url: '${Connection.baseURL}${dio.getUnitsOfProgramsEndPoint}/$programId',

    );
    if (dio.validResponse(response)) {
      final List<UnitsModel> l = [];
      response.data['data'].forEach((e) => l.add(UnitsModel.fromJson(e)));
      return l;
    } else {
      throw response.data['msg'];
    }
  }
}
