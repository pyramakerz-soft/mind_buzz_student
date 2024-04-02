import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../../core/injection/injection_container.dart' as di;

import '../../../core/talk_tts.dart';
import '../../../core/utils.dart';
import '../../who_am_i/presentation/manager/who_am_i_cubit.dart';
import '../../who_am_i/presentation/pages/who_am_i_screen.dart';
import '../mathematical_transactions/domain/entities/contact_of_lesson.dart';
import '../mathematical_transactions/presentation/manager/contact_lesson_bloc.dart';

class HandlingGameCubit extends Cubit<int> {
  final List<ContactOfLessonModel> dataOfLesson;
  HandlingGameCubit({required this.dataOfLesson}) : super(0);

  sayInstruction() async {
    await TalkTts.startTalk(text: dataOfLesson[state].message);

  }
}
