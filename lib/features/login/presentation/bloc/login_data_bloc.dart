import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/failures_messages.dart';
import '../../domain/entities/user_data_model.dart';
import '../../domain/usecases/auto_user_use_cases.dart';
import '../../domain/usecases/update_user_data_use_case.dart';
import '../../domain/usecases/user_use_cases.dart';

part 'login_data_event.dart';
part 'login_data_state.dart';

class LoginDataBloc extends Bloc<LoginDataEvent, LoginDataState> {
  final UserUseCases requestLoginData;
  final AutoUserUseCases requestAutoUserUseCases;
  final UpdateUserDataUseCases updateUserDataUseCases;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  File? profileImage;
  UserData? userData;

  LoginDataBloc(
      {required this.requestLoginData, required this.requestAutoUserUseCases, required this.updateUserDataUseCases})
      : super(LoginDataInitial()) {
    on<LoginDataEvent>((event, emit) async {
      if (event is LoginRequest) {
        emit(LoadingLoginState());
        await Future.delayed(const Duration(milliseconds: 500));
        final failureOrDoneMessage = await requestLoginData(
            email: event.email, password: event.password);
        emit(_eitherLoadedOrErrorState(failureOrDoneMessage));
      } else if (event is AutoLoginRequest) {
        emit(LoadingLoginState());
        await Future.delayed(const Duration(milliseconds: 500));
        final failureOrDoneMessage = await requestAutoUserUseCases();
        emit(_eitherLoadedOrErrorState(failureOrDoneMessage));
      }
    });
    on<UpdateUserDataEvent>((event, emit) async {
     await updateUserData(emit);
    });
    on<PickImageEvent>((event, emit) async {
     await pickImage(emit);
    });
    on<InitializeUpdateUserDataEvent>((event, emit) async {
      fullNameController.text = userData?.name ?? '';
      emailController.text =  userData?.email ?? '';
      phoneController.text = userData?.parentPhone ?? '';
     emit(UpdatingDataInitial(userData: userData!, userImage: profileImage));
    });
  }
  LoginDataState _eitherLoadedOrErrorState(
      Either<Failure, UserData> failureOrTrivia,
      ) {
    return failureOrTrivia.fold(
          (failure) => ErrorLogin(message: _mapFailureToMessage(failure)),
          (data) {
        userData = data;
        return CompleteLogin(userData: data);
      },
    );
  }


  updateUserData(emit)async{
    try {
      emit(UpdatingDataLoading());
      var res = await updateUserDataUseCases(filepath: profileImage , name: fullNameController.text ,
          phone: phoneController.text , email: emailController.text);

      res.fold((l) {
        log('getUserData fold $l');
        emit(UpdatingDataError(message: l.toString()));
      }, (data) {
        log('getUserDataSuccessfullyState ');
        userData = data;
        // TODO Dynamic message
        emit(CompleteUpdatingData(userData: data, message: 'Updated Successfully'));
      });
    } catch (e) {
      log('getUserData $e ');
      emit(UpdatingDataError(message: e.toString()));
    }
  }

  pickImage(emit) async{
    emit(UpdatingDataLoading());
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null) {
      profileImage = File(image.path);
    }
    emit(UpdatingDataInitial(userData: userData!, userImage: profileImage));
  }

}



String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      if (failure is ServerFailure) {
        return failure.message;
      }
      return SERVER_FAILURE_MESSAGE;
    case LoginFailure:
      return Login_FAILURE_MESSAGE;
    case CacheFailure:
      return CACHE_FAILURE_MESSAGE;
    case CheckYourNetwork:
      return CACHE_FAILURE_MESSAGE;
    default:
      return 'Unexpected error';
  }
}
