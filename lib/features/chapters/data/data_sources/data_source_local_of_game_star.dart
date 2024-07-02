import 'dart:core';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../phonetics/domain/entities/game_model.dart';

abstract class DataSourceLocalOfContactLesson {
  Future<void> sendStarToGameLocal(
      {required List<int> gameId, required int countOfStars});
  Future<void> clearStarInLocal();
  Future<List<GameModel>> getCountStarInLocal();
}

class DataSourceLocalOfGameStar implements DataSourceLocalOfContactLesson {
  DataSourceLocalOfGameStar();

  @override
  Future<void> sendStarToGameLocal(
      {required List<int> gameId, required int countOfStars}) async {
    print('sendStarToGameLocal');
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<GameModel> data = [];
    data.addAll(await getCountStarInLocal());
    gameId.forEach((element) {
      data.add(GameModel(id: element, stars: countOfStars));
    });
    print('sendStarToGameLocal:${data.length}');
    String dataAfterDecoder = jsonEncode(data);
    prefs.setString('stars', dataAfterDecoder);
  }

  @override
  Future<void> clearStarInLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('stars');
  }

  @override
  Future<List<GameModel>> getCountStarInLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<GameModel> data = [];

    final String? starJson = prefs.getString('stars');
    if (starJson != null) {
      final List<dynamic> personsList = jsonDecode(starJson);
      personsList
          .map((personMap) => data.add(GameModel.fromJson(personMap)))
          .toList();
      return data;
    }
    return [];
  }
}
