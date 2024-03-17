part of 'login_data_bloc.dart';

@immutable
abstract class LoginDataEvent extends Equatable {
  @override
  List<Object> get props => [];
}


class LoginRequest extends LoginDataEvent {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}