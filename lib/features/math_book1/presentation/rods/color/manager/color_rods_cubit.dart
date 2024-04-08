import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/lesson_questions.dart';

part 'color_rods_state.dart';

class ColorRodsCubit extends Cubit<ColorRodsInitial> {
  final LessonQuestionsModel questionData;

  ColorRodsCubit({required this.questionData}) : super(const ColorRodsInitial());
  submitTheSelectColor({required int colorId}){
    emit(state.copyWith(selectedColor: colorId));
  }

}
