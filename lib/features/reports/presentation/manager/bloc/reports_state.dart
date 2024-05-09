part of 'reports_bloc.dart';


@immutable
abstract class ReportsState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetReportsInitial extends ReportsState {}
class GetReportsCompleteInitial extends ReportsState {
  final MainDataTestsModel data;

  GetReportsCompleteInitial({required this.data});
}
class GetReportsLoadingInitial extends ReportsState {}
class LogOutLoadingState extends ReportsState {}
class GetReportsErrorInitial extends ReportsState {
  final String message;

  GetReportsErrorInitial({required this.message});

  @override
  List<Object> get props => [message];
}
