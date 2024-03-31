import 'dart:developer';

import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import '../../domain/entities/unit_model.dart';

abstract class DataSourceRemotelyOfUnit {
  Future<List<UnitModel>> getUnitDataRemotely({required int programId});
}


class DataSourceRemotelyOfUnitImpl implements DataSourceRemotelyOfUnit {
  final MainApiConnection dio;

  DataSourceRemotelyOfUnitImpl({required this.dio});

  @override
  Future<List<UnitModel>> getUnitDataRemotely({required int programId}) async {
log('getUnitDataRemotely');
    final response = await dio.get(
      url: '${Connection.baseURL}${dio.getUnitsOfProgramsEndPoint}/$programId',

    );
    if (dio.validResponse(response)) {
      final List<UnitModel> l = [];
      response.data['data'].forEach((e) => l.add(UnitModel.fromJson(e)));
      return l;
    } else {
      throw response.data['msg'];
    }
  }

}
