import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<int> {
  LoginCubit() : super(4);

  updateThePositionOfButton({required int newPosition}) {
    emit(newPosition);
  }
}