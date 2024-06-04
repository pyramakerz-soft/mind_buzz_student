import 'dart:core';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/apis_connections/api_connection.dart';
import '../../../../../core/connection.dart';
import '../../domain/entities/game_model.dart';

abstract class DataSourceLocalOfContactLesson {
  Future<void> sendStarToGame(
      {required List<int> gameId, required int countOfStars});
  Future<void> clearStarInLocal();
}

class DataSourceLocalOfGameStar implements DataSourceLocalOfContactLesson {
  DataSourceLocalOfGameStar();

  @override
  Future<void> sendStarToGame(
      {required List<int> gameId, required int countOfStars}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    final List<GameModel> l = [];
    final List<dynamic> personsList =
        jsonDecode(prefs.getString('stars') ?? '');
    personsList
        .map((personMap) => l.add(GameModel.fromJson(personMap)))
        .toList();


  }

  @override
  Future<void> clearStarInLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('stars');
  }
}
