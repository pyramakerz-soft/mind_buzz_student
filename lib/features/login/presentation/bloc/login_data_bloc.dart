import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:mind_buzz_refactor/core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/failures_messages.dart';
import '../../../../core/singleton.dart';
import '../../domain/entities/user_data_model.dart';
import '../../domain/usecases/auto_user_use_cases.dart';
import '../../domain/usecases/update_pin_code_use_cases.dart';
import '../../domain/usecases/update_user_data_use_case.dart';
import '../../domain/usecases/user_use_cases.dart';

part 'login_data_event.dart';
part 'login_data_state.dart';

class LoginDataBloc extends Bloc<LoginDataEvent, LoginDataState> {
  final UserUseCases requestLoginData;
  final AutoUserUseCases requestAutoUserUseCases;
  final UpdateUserDataUseCases updateUserDataUseCases;
  final CreatePassCodeUseCases createPassCodeUseCases;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  PhoneNumber? phoneCode ;
  File? profileImage;
  UserData? userData;

  LoginDataBloc(
      {required this.requestLoginData, required this.requestAutoUserUseCases, required this.updateUserDataUseCases, required this.createPassCodeUseCases})
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
      else if (event is CreatePinCodeEvent) {
        emit(LoadingLoginState());
        await Future.delayed(const Duration(milliseconds: 500));
        final failureOrDoneMessage = await createPassCodeUseCases(event.pinCode);
        emit(_eitherCreatedOrErrorState(failureOrDoneMessage,event.pinCode));
      }
    });
    on<UpdateUserDataEvent>((event, emit) async {
     await updateUserData(emit);
    });
    on<PickImageEvent>((event, emit) async {
     await pickImage(emit);
    });
    on<ChangePhoneCodeEvent>((event, emit) async {
      phoneCode = PhoneNumber(countryISOCode: event.country.dialCode, countryCode: event.country.code, number: phoneController.text) ;
      emit(UpdatingDataInitial(userData: userData!, userImage: profileImage));
    });
    on<InitializeUpdateUserDataEvent>((event, emit) async {
      fullNameController.text = userData?.name ?? '';
      emailController.text =  userData?.email ?? '';
 if(userData?.parentPhone!=null && userData!.parentPhone!.isNotEmpty)
      phoneCode = PhoneNumber.fromCompleteNumber(completeNumber: userData!.parentPhone!);
      phoneController.text = userData?.parentPhone?.substring(phoneCode?.countryISOCode.length??0) ?? '';
     emit(UpdatingDataInitial(userData: userData!, userImage: profileImage,phoneCode: phoneCode?.countryISOCode));
    });

    on<ChangeInUpdateUserDataEvent>((event, emit) {
      if(fullNameController.text!= userData?.name || emailController.text!= userData?.email || phoneController.text != userData?.parentPhone)
        emit(UpdatingDataChanged());
      else
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
  LoginDataState _eitherCreatedOrErrorState(
      Either<Failure, bool> failureOrTrivia,
      String pinCode
      ) {
    return failureOrTrivia.fold(
          (failure) => ErrorLogin(message: _mapFailureToMessage(failure)),
          (data) {
        userData?.parentPassword = pinCode;
        return CreatePinCodeSuccessfully();
      },
    );
  }


  updateUserData(emit,)async{

    emit(UpdatingDataLoading());
    try {
      var res = await updateUserDataUseCases(filepath: profileImage , name: fullNameController.text ,
          phone: (int.tryParse(phoneCode?.countryISOCode??'20')?? int.tryParse(phoneCode?.countryCode??'20')??'20').toString() + phoneController.text ,
          email: emailController.text);

      res.fold((l) {
        log('updateUserData fold $l');
        emit(UpdatingDataError(message: l.toString()));
      }, (data) {
        log('updateUserDataSuccessfullyState ');
        userData = data;
        // TODO Dynamic message
        emit(CompleteUpdatingData(userData: data, message: 'Updated Successfully'));
        // add(AutoLoginRequest());
      });
    } catch (e) {
      log('updateUserData $e ');
      emit(UpdatingDataError(message: e.toString()));
    }
  }


  pickImage(emit) async{
    emit(UpdatingDataLoading());
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if(image != null) {
      profileImage = File(image.path);
      add(ChangeInUpdateUserDataEvent());
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
