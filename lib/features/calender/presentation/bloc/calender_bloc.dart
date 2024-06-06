import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/enums/direction.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/utils.dart';
import '../../../home/domain/entities/test_model.dart';
import '../../../student_assignment/domain/entities/main_data_test.dart';
import '../../../student_assignment/domain/usecases/parent_assignment_use_cases.dart';



part 'calender_event.dart';
part 'calender_state.dart';

class CalenderBloc extends Bloc<CalenderEvent, CalenderState> {
  final ParentAssignmentUseCases programUserUseCases;
  List<TestModel> tests = [];
  late PageController pageController;
  DateTime focusedDay = DateTime.now();

  CalenderBloc({required this.programUserUseCases}) : super(GetCalenderInitial()) {
    on<GetCalenderRequest>((event, emit) async {
      await getAssignments(emit);

    });
    on<SwapCalenderEvent>((event, emit) async {
      await swapCalender(emit,event.direction);

    });
    on<SelectDayEvent>((event, emit) async {
      await selectDay(emit,event.day);
    });
    on<SelectMonthEvent>((event, emit) async {
      await selectMonth(emit,event.currentTime);
    });
  }

  List<TestModel> get filteredList => tests.where((element) => Utils.parseStringToDate(element.createdAt!) ==
      Utils.formatDate(focusedDay)).toList();

  getAssignments(emit) async {
    emit(GetCalenderLoadingInitial());
    try {
      var res = await programUserUseCases(isFuture:true);
      res.fold((l) {
        log('getUserData fold $l');
        emit(GetCalenderErrorInitial(message: _mapFailureToMessage(l)));
      }, (data) {
        log('getUserDataSuccessfullyState ');
        tests = data.tests??[];
        emit(GetCalenderCompleteInitial(tests: filteredList, currentDate: focusedDay));
      });
    } catch (e) {
      log('getUserData $e ');
      emit(GetCalenderErrorInitial(message: e.toString()));
    }
  }

  swapCalender(emit , Direction direction){
    emit(GetCalenderLoadingInitial());
    if(direction == Direction.left) {
      focusedDay = focusedDay.month<12 ? DateTime(focusedDay.year ,  focusedDay.month + 1 , focusedDay.day):
      DateTime(focusedDay.year + 1 ,  1 , focusedDay.day);
      pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
    else{
      focusedDay = focusedDay.month > 1 ? DateTime(focusedDay.year ,  focusedDay.month - 1 , focusedDay.day):
      DateTime(focusedDay.year - 1 ,  12 , focusedDay.day);
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
    emit(GetCalenderCompleteInitial(tests: filteredList, currentDate: focusedDay));
  }

  selectDay(emit , int day){
    emit(GetCalenderLoadingInitial());
    focusedDay = DateTime(focusedDay.year , focusedDay.month , day);
    emit(GetCalenderCompleteInitial(tests: filteredList, currentDate: focusedDay));
  }
  selectMonth(emit , DateTime currentTime){
    emit(GetCalenderLoadingInitial());
    focusedDay = currentTime;
    emit(GetCalenderCompleteInitial(tests: filteredList, currentDate: focusedDay));
  }
}



String _mapFailureToMessage(Failure failure) {

  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;
    case LoginFailure:
      return Login_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    case ReLoginFailure:
      return RELOGIN_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}