part of 'get_unit_bloc.dart';

@immutable
abstract class GetUnitState extends Equatable {
  @override
  List<Object> get props => [];
}
class GetUnitInitial extends GetUnitState {}

class GetProgramsHomeInitial extends GetUnitState {}
class GetProgramsCompleteInitial extends GetUnitState {
  final List<UnitModel> data;

  GetProgramsCompleteInitial({required this.data});
}
class GetProgramsLoadingInitial extends GetUnitState {}
class LogOutLoadingState extends GetUnitState {}
class GetProgramsErrorInitial extends GetUnitState {
  final String message;

  GetProgramsErrorInitial({required this.message});

  @override
  List<Object> get props => [message];
}
