//
// import '../../features/intro_page/domain/entities/based_game_model.dart';
// import '../../features/intro_page/domain/entities/data_game_model.dart';
// import '../../features/intro_page/domain/entities/game_letters_model.dart';
// import '../../features/intro_page/domain/entities/game_model.dart';
//
// abstract class GamesTypes {
//   int index = 1;
//   BasedGameModel? currentGameData = BasedGameModel(
//     data: DataGameModel(
//         gameLetters: [
//           GameLettersModel(letter: 's'),
//           GameLettersModel(letter: 'a'),
//           GameLettersModel(letter: 't'),
//           GameLettersModel(letter: 'm'),
//         ],
//         game: GameModel(
//             numOfTrials: 5,
//             numOfLetterRepeat: 5,
//             message: "Put the letters given into the correct box",
//             gameLetters: [
//               GameLettersModel(letter: 't'),
//               GameLettersModel(letter: 't'),
//               GameLettersModel(letter: 't'),
//               GameLettersModel(letter: 't'),
//               GameLettersModel(letter: 's'),
//               GameLettersModel(letter: 's'),
//               GameLettersModel(letter: 's'),
//               GameLettersModel(letter: 's'),
//               GameLettersModel(letter: 'a'),
//               GameLettersModel(letter: 'a'),
//               GameLettersModel(letter: 'a'),
//               GameLettersModel(letter: 'a'),
//               GameLettersModel(letter: 'm'),
//               GameLettersModel(letter: 'm'),
//               GameLettersModel(letter: 'm'),
//               GameLettersModel(letter: 'm'),
//             ])),
//   );
// }
//
// class SortingStripes implements GamesTypes {
//   @override
//   int index = 1;
//   @override
//   BasedGameModel? currentGameData = BasedGameModel(
//     data: DataGameModel(
//         gameLetters: [
//           GameLettersModel(letter: 's'),
//           GameLettersModel(letter: 'a'),
//           GameLettersModel(letter: 't'),
//           GameLettersModel(letter: 'm'),
//         ],
//         game: GameModel(
//             numOfTrials: 5,
//             numOfLetterRepeat: 5,
//             message: "Put the letters given into the correct box",
//             gameLetters: [
//               GameLettersModel(letter: 't', id: 0),
//               GameLettersModel(letter: 't', id: 1),
//               GameLettersModel(letter: 't', id: 2),
//               GameLettersModel(letter: 't', id: 3),
//               GameLettersModel(letter: 't', id: 4),
//               GameLettersModel(letter: 's', id: 5),
//               GameLettersModel(letter: 's', id: 6),
//               GameLettersModel(letter: 's', id: 7),
//               GameLettersModel(letter: 's', id: 8),
//               GameLettersModel(letter: 's', id: 9),
//               GameLettersModel(letter: 'a', id: 10),
//               GameLettersModel(letter: 'a', id: 11),
//               GameLettersModel(letter: 'a', id: 12),
//               GameLettersModel(letter: 'a', id: 13),
//               GameLettersModel(letter: 'a', id: 14),
//               GameLettersModel(letter: 'm', id: 15),
//               GameLettersModel(letter: 'm', id: 16),
//               GameLettersModel(letter: 'm', id: 17),
//               GameLettersModel(letter: 'm', id: 18),
//               GameLettersModel(letter: 'm', id: 19),
//             ])),
//   );
// }
//
