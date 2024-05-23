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
      int audioFlag = data[index].audioFlag ?? 0;
      print("subLetter:$subLetter ,subGame:$subGame, audioFlag:$audioFlag");
     return MainDataOfPhonetics.getGameDataType(subLetter: subLetter, subGame: subGame,audioFlag:audioFlag );
    }
    return null;
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
