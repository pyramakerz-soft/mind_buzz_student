part of 'get_assignment_bloc.dart';

@immutable
abstract class GetAssignmentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetAssignmentRequest extends GetAssignmentEvent {
  final int programId;
  final String? fromDate;
  final String? toDate;
  final String? status;
  final List<String>? listOfTypes;
  GetAssignmentRequest({this.fromDate, this.toDate, this.status, this.listOfTypes, required this.programId});

  @override
  List<Object> get props => [programId];
}
