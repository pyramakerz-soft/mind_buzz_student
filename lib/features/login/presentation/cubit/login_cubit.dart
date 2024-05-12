import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_data_model.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStateInitial> {
  LoginCubit() : super(LoginStateInitial());

  updateThePositionOfButton({required int newPosition}) {
    emit(state.copyWith(position: newPosition));
  }
  updateTheShowPassword(){
    bool tempState = state.showPassword ?? true;
    tempState = !tempState;
    emit(state.copyWith(showPassword: tempState));
  }
  updateDisableButton({required bool supState})  {
   emit(state.copyWith(disableButton: supState));
  }

  UserData? userData;
  saveUserData({required UserData userData}){
    this.userData = userData;
  }
}