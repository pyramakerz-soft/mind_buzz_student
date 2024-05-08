part of 'calender_bloc.dart';

@immutable
abstract class CalenderEvent extends Equatable {
  @override
  List<Object> get props => [];
}



class GetCalenderRequest extends CalenderEvent {
  GetCalenderRequest();

  @override
  List<Object> get props => [];
}

class SwapCalenderEvent extends CalenderEvent {
  final Direction direction;

  SwapCalenderEvent({required this.direction});

  @override
  List<Object> get props => [direction];
}

class SelectDayEvent extends CalenderEvent {
  final int day;

  SelectDayEvent({required this.day});

  @override
  List<Object> get props => [day];
}
class SelectMonthEvent extends CalenderEvent {
  final DateTime currentTime;

  SelectMonthEvent({required this.currentTime});

  @override
  List<Object> get props => [currentTime];
}