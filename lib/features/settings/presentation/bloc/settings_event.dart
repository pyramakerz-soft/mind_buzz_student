part of 'settings_bloc.dart';

@immutable
abstract class SettingsEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class GetUserData extends SettingsEvent {}

