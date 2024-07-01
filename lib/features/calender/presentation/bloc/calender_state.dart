part of 'calender_bloc.dart';

@immutable
abstract class CalenderState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCalenderInitial extends CalenderState {}

class GetCalenderCompleteInitial extends CalenderState {
  final List<TestModel> tests;
  final DateTime currentDate;
  GetCalenderCompleteInitial({required this.tests, required this.currentDate});
  @override
  List<Object> get props => [tests];
}

class GetCalenderLoadingInitial extends CalenderState {}

class GetCalenderErrorInitial extends CalenderState {
  final String message;

  GetCalenderErrorInitial({required this.message});

  @override
  List<Object> get props => [message];
}

class CalenderSwapped extends CalenderState {
  final DateTime currentDate;
  CalenderSwapped({required this.currentDate});
  @override
  List<Object> get props => [currentDate];
}
