part of 'get_unit_bloc.dart';

@immutable
abstract class GetUnitEvent extends Equatable {
  @override
  List<Object> get props => [];
}



class GetUnitRequest extends GetUnitEvent {
  final int programId;

  GetUnitRequest({required this.programId});

  @override
  List<Object> get props => [programId];
}
