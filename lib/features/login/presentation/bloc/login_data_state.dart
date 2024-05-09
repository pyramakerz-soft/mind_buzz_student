part of 'login_data_bloc.dart';

@immutable
abstract class LoginDataState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginDataInitial extends LoginDataState {}

class LoadingLoginState extends LoginDataState {}

class CompleteLogin extends LoginDataState {
  final UserData userData;
  CompleteLogin({required this.userData});

  @override
  List<Object?> get props => [userData];
}

class ErrorLogin extends LoginDataState {
  final String message;

  ErrorLogin({required this.message});

  @override
  List<Object?> get props => [message];
}

class UpdatingDataInitial extends LoginDataState {
  final UserData userData;
  final File? userImage;
  final bool loading;
  UpdatingDataInitial ({required this.userData, this.userImage, this.loading = false,});
  UpdatingDataInitial copyWith({
    required UserData userData,
    File? userImage,
    bool? loading,
  }) {
    return UpdatingDataInitial(
      userData: this.userData,
      userImage: this.userImage,
      loading: this.loading
    );
  }
  @override
  List<Object?> get props => [userData, userImage];
}
class CompleteUpdatingData extends LoginDataState {
  final UserData userData;
  final String? userImage;
  CompleteUpdatingData({required this.userData, this.userImage});

  @override
  List<Object?> get props => [userData];
}

class UpdatingDataLoading extends LoginDataState {}

class UpdatingDataError extends LoginDataState {
  final String message;

  UpdatingDataError({required this.message});

  @override
  List<Object?> get props => [message];
}
