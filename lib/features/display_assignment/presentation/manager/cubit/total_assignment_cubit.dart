import 'package:based_of_eng_game/based_of_eng_game.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'total_assignment_state.dart';

class TotalAssignmentCubit extends Cubit<TotalAssignmentInitial> {
  TotalAssignmentCubit({required List<GameFinalModel> assignmentData})
      : super(TotalAssignmentInitial(
            assignmentData: assignmentData,
            index: 0,
            currentAssignment: assignmentData[0]));

  reFormatData() {
    print('reFormatData:');
    int index = state.index;
    index = index + 1;
    emit(state.copyWith(
        currentAssignment: state.assignmentData[state.index], index: index));
  }

  MainDataOfChapters getMainContactData({required int index}) {
    List<GameFinalModel> data = state.assignmentData;

    // if (data != null) {
    //   log(data?[index].toJson().toString() ?? '');
    print('data[index].toJson()');
    print("subProgram:$data");

    String subLetter = data[index].mainLetter ?? '';
    String unitName = data[index].lesson?.unit?.name ?? '';
    String subGame = data[index].gameTypes?.name ?? '';
    String programName = data[index].lesson?.unit?.program?.course?.name ?? '';
    int audioFlag = data[index].audioFlag ?? 0;
    String lessonName = data[index].lesson?.name ?? '';
    String gameName = data[index].name ?? '';
    String stageName = data[index].stageName ?? '';
    print(
        "subLetter:$subLetter ,subGame:$subGame, audioFlag:$audioFlag, unitName:$unitName");
    return HandlingActionsAndDataOfChapters.getTheChapterDataType(
        subLetter: subLetter,
        subGame: subGame,
        unitName: unitName,
        programName: programName,
        audioFlag: audioFlag,
        lessonName: lessonName,
        gameName: gameName,
        stageName: stageName);
    // } else {
    //   return null;
    // }
  }
}
