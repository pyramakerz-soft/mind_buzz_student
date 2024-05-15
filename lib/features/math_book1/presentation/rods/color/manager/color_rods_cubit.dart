// import 'dart:ui';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../domain/entities/game_model.dart';
//
// part 'color_rods_state.dart';
//
// class ColorRodsCubit extends Cubit<ColorRodsInitial> {
//   final LessonQuestionsModel questionData;
//
//   ColorRodsCubit({required this.questionData}) : super(const ColorRodsInitial());
//   submitTheSelectColor({required int colorId}){
//     emit(state.copyWith(selectedColor: colorId));
//   }
//
//   submitTheColor({required Color newColor, required int index}){
//     List<Color> selectedColorsOfBox = state.selectedColorsOfBox??[];
//     if(state.selectedColorsOfBox?.isEmpty??false){
//       selectedColorsOfBox.add(newColor);
//     }
//     else{
//       if(selectedColorsOfBox.length>(index+1)){
//         selectedColorsOfBox.insert(index, newColor);
//       }else{
//         selectedColorsOfBox.add(newColor);
//       }
//     }
//     emit(state.copyWith(selectedColorsOfBox: selectedColorsOfBox));
//   }
//
// }
