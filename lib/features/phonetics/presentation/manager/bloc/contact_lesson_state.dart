part of 'contact_lesson_bloc.dart';

@immutable
abstract class ContactLessonState extends Equatable {
  @override
  List<Object> get props => [];
}

class ContactLessonInitial extends ContactLessonState {}

class GetContactInitial extends ContactLessonState {
  final List<GameModel> data;

  GetContactInitial({required this.data});

  MainDataOfPhonetics? getMainContactData({required int index}) {
    String subProgram = data[index].lesson?.unit?.program?.course?.name ?? '';
    if (subProgram == BasicOfEveryGame.phonics) {
      String subLetter = data[index].mainLetter ?? '';
      String subGame = data[index].gameTypes?.name ?? '';
      // print("subLetter:$subLetter ,subGame:$subGame");
      if (subGame.toLowerCase() == DragOutGameS().keyGame.toLowerCase()) {
        // print((subGame.toLowerCase() == DragOutGameS().keyGame.toLowerCase()));
        // print((subLetter.toLowerCase() == MainDataOfPhonetics.letterS.toLowerCase()));
        // print((subLetter.toLowerCase() == MainDataOfPhonetics.letterA.toLowerCase()));
        if (subLetter.toLowerCase() == MainDataOfPhonetics.letterS.toLowerCase()) {
          return SPhonetics(mineGameData: DragOutGameS());
        }else if(subLetter.toLowerCase() == MainDataOfPhonetics.letterA.toLowerCase()) {
          return APhonetics(mineGameData: DragOutGameS());
        }
      }
    }
  }
}

class GetContactLoadingInitial extends ContactLessonState {}

class LogOutLoadingState extends ContactLessonState {}

class NotSupportTypeState extends ContactLessonState {}

class CompleteGameState extends ContactLessonState {}

class GetContactErrorInitial extends ContactLessonState {
  final String message;

  GetContactErrorInitial({required this.message});

  @override
  List<Object> get props => [message];
}
