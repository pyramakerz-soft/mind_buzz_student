part of 'login_data_bloc.dart';

@immutable
abstract class LoginDataState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginDataInitial extends LoginDataState {}

class LoadingLoginState extends LoginDataState {}

class CompleteLogin extends LoginDataState {
  final UserData userData;
  CompleteLogin({required this.userData});

  @override
  List<Object> get props => [userData];
}

class ErrorLogin extends LoginDataState {
  final String message;

  ErrorLogin({required this.message});

  @override
  List<Object> get props => [message];
}
