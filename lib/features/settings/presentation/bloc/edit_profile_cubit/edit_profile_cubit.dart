import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mind_buzz_refactor/features/login/domain/entities/user_data_model.dart';
import 'package:mind_buzz_refactor/features/settings/data/repositories/settings_repository.dart';
import 'package:mind_buzz_refactor/features/settings/presentation/bloc/edit_profile_cubit/edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this._repository)
      : super(EditProfileState(status: EditProfileStateStatus.initial));
  final EditProfileRepository _repository;
  void setUserData(UserData userData) {
    emit(state.copyWith(oldUserData: userData, userData: UserData()));
  }

  void onNameChange(String? name) {
    emit(state.copyWith(
        userData: state.userData?.copyWith(name: name),
        status: EditProfileStateStatus.changing));
  }

  void onPhoneChange(String? phoneNumber) {
    emit(state.copyWith(
        userData: state.userData?.copyWith(parentPhone: phoneNumber),
        status: EditProfileStateStatus.changing));
  }

  void onCountryCodeChange(String countryCode) {
    emit(state.copyWith(
        userData: state.userData?.copyWith(countryCode: countryCode),
        status: EditProfileStateStatus.changing));
  }

  void setImage(XFile image) {
    emit(state.copyWith(
        selectedImage: File(image.path),
        status: EditProfileStateStatus.changing));
  }

  Future<void> updateUserData() async {
    emit(state.copyWith(status: EditProfileStateStatus.loading));
    try {
      if (state.userData == state.oldUserData) {
        return emit(state.copyWith(
            status: EditProfileStateStatus.error,
            message: 'you have to change any data '));
      }
      final userData = state.userData ?? state.oldUserData;
      await _repository.updateUserData(userData!,
          profilePicture: state.selectedImage);

      emit(state.copyWith(status: EditProfileStateStatus.loaded));
    } catch (e) {
      emit(state.copyWith(
          status: EditProfileStateStatus.error,
          message: e is DioException
              ? e.type == DioExceptionType.connectionError ||
                      e.type == DioExceptionType.connectionTimeout
                  ? "Check Your network"
                  : "Server Error"
              : e.toString()));
    }
  }
}
