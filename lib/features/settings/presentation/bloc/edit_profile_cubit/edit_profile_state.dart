// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:mind_buzz_refactor/features/login/domain/entities/user_data_model.dart';

enum EditProfileStateStatus { initial, loading, changing, loaded, error }

extension EditProfileStateX on EditProfileState {
  bool get isInitial => status == EditProfileStateStatus.initial;
  bool get isChanging => status == EditProfileStateStatus.changing;
  bool get isLoading => status == EditProfileStateStatus.loading;
  bool get isLoaded => status == EditProfileStateStatus.loaded;
  bool get isError => status == EditProfileStateStatus.error;
}

class EditProfileState {
  final EditProfileStateStatus status;
  final String? message;
  final File? selectedImage;
  final UserData? userData;
  final UserData? oldUserData;
  EditProfileState({
    this.status = EditProfileStateStatus.initial,
    this.message,
    this.selectedImage,
    this.userData,
    this.oldUserData,
  });

  EditProfileState copyWith({
    EditProfileStateStatus? status,
    String? message,
    File? selectedImage,
    UserData? userData,
    UserData? oldUserData,
  }) {
    return EditProfileState(
        status: status ?? this.status,
        message: message ?? this.message,
        selectedImage: selectedImage ?? this.selectedImage,
        userData: userData ?? this.userData,
        oldUserData: oldUserData ?? this.oldUserData);
  }

  @override
  bool operator ==(covariant EditProfileState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.message == message &&
        other.userData == userData &&
        other.selectedImage == selectedImage &&
        other.oldUserData == oldUserData;
  }

  @override
  int get hashCode =>
      status.hashCode ^
      message.hashCode ^
      userData.hashCode ^
      selectedImage.hashCode ^
      oldUserData.hashCode;

  @override
  String toString() =>
      'NotificationsState(status: $status, message: $message, userData: $userData )';
}
