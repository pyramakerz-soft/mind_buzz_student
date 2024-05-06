part of 'settings_bloc.dart';

@immutable
abstract class SettingsState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetSettingsInitial extends SettingsState {}
class GetUserDataInitial extends SettingsState {}
class GetUserDataSuccessfully extends SettingsState {
 final UserData userData;
 GetUserDataSuccessfully({required this.userData});
 @override
 List<Object> get props => [userData];
}
class GetSettingsLoadingInitial extends SettingsState {}
class GetSettingsErrorInitial extends SettingsState {
  final String message;

  GetSettingsErrorInitial({required this.message});

  @override
  List<Object> get props => [message];
}
