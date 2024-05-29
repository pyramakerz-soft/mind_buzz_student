part of 'login_data_bloc.dart';

@immutable
abstract class LoginDataEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class LoginRequest extends LoginDataEvent {
  final String email;
  final String password;

  LoginRequest({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}



class AutoLoginRequest extends LoginDataEvent {
  AutoLoginRequest();

  @override
  List<Object> get props => [];
}
class InitializeUpdateUserDataEvent extends LoginDataEvent {}
class ChangeInUpdateUserDataEvent extends LoginDataEvent {

}
class UpdateUserDataEvent extends LoginDataEvent {}
class PickImageEvent extends LoginDataEvent {}
class CreatePinCodeEvent extends LoginDataEvent {
 final String pinCode;
 CreatePinCodeEvent({required this.pinCode});
}
class ChangePhoneCodeEvent extends LoginDataEvent {
  final Country country;
  ChangePhoneCodeEvent({required this.country});
}
