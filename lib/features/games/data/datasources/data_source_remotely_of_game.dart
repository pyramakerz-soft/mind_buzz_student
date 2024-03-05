import '../../../../core/apis_connections/api_connection.dart';
import '../../../../core/connection.dart';
import '../../domain/entities/based_game_model.dart';

abstract class DataSourceRemotelyOfGame {
  Future<BasedGameModel> getGameDataRemotely({required String index});
}


class DataSourceRemotelyOfGameImpl implements DataSourceRemotelyOfGame {
  final MainApiConnection dio;

  DataSourceRemotelyOfGameImpl({required this.dio});

  @override
  Future<BasedGameModel> getGameDataRemotely({required String index}) async {
    final response = await dio.get(
      url: '${Connection.baseURL}${dio.getGameInfoDataEndPoint}/$index',
      queryParameters: {
        ...MainApiConnection.apiHeaders,
      },
    );
    if (dio.validResponse(response.statusCode!)) {
      return BasedGameModel.fromJson(response.data);
    } else {
      throw response.data['msg'];
    }
  }
}
