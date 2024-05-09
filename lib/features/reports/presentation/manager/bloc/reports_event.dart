part of 'reports_bloc.dart';

@immutable
abstract class ReportsEvent {}

class GetReportsRequest extends ReportsEvent {
  final String? date;
  GetReportsRequest({this.date});

  @override
  List<Object?> get props => [date];
}