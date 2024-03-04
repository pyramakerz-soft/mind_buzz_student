import 'package:dio/dio.dart';

import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import '../../domain/entities/based_game_model.dart';

abstract class DataSourceRemotelyOfGame {
  Future<BasedGameModel> getGameDataRemotely({required String index});
}

class DataSourceRemotelyOfGameImpl extends MainApiConnection {
  @override
  Future<BasedGameModel> getGameDataRemotely({required String index}) async {
    final response = await MainApiConnection.dio.get(
      '${Connection.baseURL}${MainApiConnection.getGameInfoDataEndPoint}/$index',
      options: Options(
        headers: {
          ...MainApiConnection.apiHeaders,
        },
      ),
    );
    if (MainApiConnection.validResponse(response.statusCode!)) {
      return BasedGameModel.fromJson(response.data);
    } else {
      throw response.data['msg'];
    }
  }
}
