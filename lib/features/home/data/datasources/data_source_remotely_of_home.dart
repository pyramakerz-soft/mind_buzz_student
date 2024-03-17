import 'dart:developer';

import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import '../../domain/entities/program_model.dart';
import '../../domain/entities/programs_model.dart';

abstract class DataSourceRemotelyOfPrograme {
  Future<ProgramModel> getLoginDataRemotely({required String email, required String password});
}


class DataSourceRemotelyOfProgramImpl implements DataSourceRemotelyOfPrograme {
  final MainApiConnection dio;

  DataSourceRemotelyOfProgramImpl({required this.dio});

  @override
  Future<ProgramModel> getLoginDataRemotely({required String email, required String password}) async {

    final response = await dio.get(
      url: '${Connection.baseURL}${dio.getStudentProgramsEndPoint}',

    );
    if (dio.validResponse(response)) {
      return ProgramModel.fromJson(response.data['data']['user_courses']);
    } else {
      throw response.data['msg'];
    }
  }
}
