part of 'contact_lesson_bloc.dart';

enum StateOfGetDataOfGame {
  contactLessonInitial,
  getContactLoadingInitial,
  doneGetDataOfGame,
  logOutLoadingState,
  notSupportTypeState,
  completeGameState,
  getContactErrorInitial
}

extension GetContactInitialX on GetContactInitial {
  bool get isInitial => status == StateOfGetDataOfGame.contactLessonInitial;
  bool get isLoading => status == StateOfGetDataOfGame.getContactLoadingInitial;
  bool get logout => status == StateOfGetDataOfGame.logOutLoadingState;
  bool get done => status == StateOfGetDataOfGame.doneGetDataOfGame;
  bool get notSupport => status == StateOfGetDataOfGame.notSupportTypeState;
  bool get isError => status == StateOfGetDataOfGame.getContactErrorInitial;
}

@immutable
class GetContactInitial extends Equatable {
  final StateOfGetDataOfGame status;
  final List<GameFinalModel>? data;
  final String? message;
  final Artboard? avatarArtboardLoading;

  const GetContactInitial(
      {this.status = StateOfGetDataOfGame.contactLessonInitial,
      this.data,
      this.avatarArtboardLoading,
      this.message});

  MainDataOfChapters? getMainContactData({required int index}) {
    if (data != null) {
      log(data?[index].toJson().toString() ?? '');
      print('data[index].toJson()');
      print("subProgram:$data");

      String subLetter = data?[index].mainLetter ?? '';
      String unitName = data?[index].lesson?.unit?.name ?? '';
      String subGame = data?[index].gameTypes?.name ?? '';
      String programName =
          data?[index].lesson?.unit?.program?.course?.name ?? '';
      int audioFlag = data?[index].audioFlag ?? 0;
      String lessonName = data?[index].lesson?.name ?? '';
      String gameName = data?[index].name ?? '';

      print(
          "subLetter:$subLetter ,subGame:$subGame, audioFlag:$audioFlag, unitName:$unitName");
      return HandlingActionsAndDataOfChapters.getTheChapterDataType(
          subLetter: subLetter,
          subGame: subGame,
          unitName: unitName,
          lessonName: lessonName,
          gameName: gameName,
          programName: programName,
          audioFlag: audioFlag);
    } else {
      return null;
    }
  }

  @override
  List<Object?> get props => [message, data, status, avatarArtboardLoading];

  @override
  bool operator ==(covariant GetContactInitial other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.avatarArtboardLoading == avatarArtboardLoading &&
        other.data == data;
  }

  @override
  int get hashCode =>
      status.hashCode ^
      message.hashCode ^
      data.hashCode ^
      avatarArtboardLoading.hashCode;
}
