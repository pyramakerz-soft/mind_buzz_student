import '../../domain/entities/based_game_model.dart';
import '../../domain/entities/data_game_model.dart';
import '../../domain/entities/game_letters_model.dart';
import '../../domain/entities/game_model.dart';

abstract class DataSourceLocalOfGame {
  Future<BasedGameModel> getGameDataLocal();
}

class DataSourceLocalOfGameImpl implements DataSourceLocalOfGame {
  @override
  Future<BasedGameModel> getGameDataLocal() async {
    return BasedGameModel(
      data: DataGameModel(
          gameLetters: [
            GameLettersModel(letter: 's'),
            GameLettersModel(letter: 'a'),
            GameLettersModel(letter: 't'),
            GameLettersModel(letter: 'm'),
          ],
          game: GameModel(
              numOfTrials: 5,
              numOfLetterRepeat: 5,
              message: "Put the letters given into the correct box",
              gameLetters: [
                GameLettersModel(letter: 't'),
                GameLettersModel(letter: 't'),
                GameLettersModel(letter: 't'),
                GameLettersModel(letter: 't'),
                GameLettersModel(letter: 's'),
                GameLettersModel(letter: 's'),
                GameLettersModel(letter: 's'),
                GameLettersModel(letter: 's'),
                GameLettersModel(letter: 'a'),
                GameLettersModel(letter: 'a'),
                GameLettersModel(letter: 'a'),
                GameLettersModel(letter: 'a'),
                GameLettersModel(letter: 'm'),
                GameLettersModel(letter: 'm'),
                GameLettersModel(letter: 'm'),
                GameLettersModel(letter: 'm'),
              ])),
    );
  }
}
