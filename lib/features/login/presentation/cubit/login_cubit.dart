import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/user_data_model.dart';

class LoginCubit extends Cubit<int> {
  LoginCubit() : super(4);

  updateThePositionOfButton({required int newPosition}) {
    emit(newPosition);
  }

  UserData? userData;
  saveUserData({required UserData userData}){
    this.userData = userData;
  }
}