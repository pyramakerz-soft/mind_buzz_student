import 'dart:io';

import 'package:mind_buzz_refactor/features/login/domain/entities/user_data_model.dart';
import 'package:mind_buzz_refactor/features/settings/data/datasources/settings_remote_source.dart';

abstract class EditProfileRepository {
  Future<void> updateUserData(UserData userData, {File? profilePicture});
}

class EditProfileRepositoryImpl implements EditProfileRepository {
  final SettingsRemoteDataSource _remoteDataSource;
  EditProfileRepositoryImpl(this._remoteDataSource);
  @override
  Future<void> updateUserData(UserData userData, {File? profilePicture}) {
    return _remoteDataSource.updateUserData(userData,
        profilePicture: profilePicture);
  }
}
