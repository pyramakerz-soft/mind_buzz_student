import 'assets_images_phonetics.dart';
import 'basic_of_phonetics.dart';

abstract class BasicOfEveryGame{
  late bool isRound;
  late String titleImage;
  late String keyGame;

  static String phonics = 'Phonics';

}

class DragOutGameS implements BasicOfEveryGame{

  @override
  bool isRound = false;

  @override
  String titleImage =AppImagesPhonetics.dragOut ;

  @override
  String keyGame ='Drag Out';

}