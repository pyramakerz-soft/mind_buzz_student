part of 'calender_bloc.dart';



@immutable
abstract class CalenderState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetCalenderInitial extends CalenderState {}
class GetCalenderCompleteInitial extends CalenderState {

}
class GetCalenderLoadingInitial extends CalenderState {}
class GetCalenderErrorInitial extends CalenderState {
  final String message;

  GetCalenderErrorInitial({required this.message});

  @override
  List<Object> get props => [message];
}
