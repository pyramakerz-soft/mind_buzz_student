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
      print("subLetter:$subLetter ,subGame:$subGame");
      if (subGame.toLowerCase() == BasicDragOutGame().keyGame.toLowerCase()) {
        if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterS.toLowerCase()) {
          return SPhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterA.toLowerCase()) {
          return APhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterF.toLowerCase()) {
          return FPhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterM.toLowerCase()) {
          return MPhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterT.toLowerCase()) {
          return TPhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterC.toLowerCase()) {
          return CPhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterR.toLowerCase()) {
          return RPhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterI.toLowerCase()) {
          return IPhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterP.toLowerCase()) {
          return PPhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterH.toLowerCase()) {
          return HPhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterJ.toLowerCase()) {
          return JPhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterU.toLowerCase()) {
          return UPhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterL.toLowerCase()) {
          return LPhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterB.toLowerCase()) {
          return BPhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterO.toLowerCase()) {
          return OPhonetics(mineGameData: BasicDragOutGame());
        } else if (subLetter.toLowerCase() ==
            MainDataOfPhonetics.letterG.toLowerCase()) {
          return GPhonetics(mineGameData: BasicDragOutGame());
        }
      }
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
