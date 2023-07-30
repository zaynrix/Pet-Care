import 'dart:convert';

import 'package:pet_care/data/local_data/storage_constant.dart';
import 'package:pet_care/features/auth/auth_model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final SharedPreferences sharedPreferences;

  StorageService(this.sharedPreferences);

  // Authentication related methods

  /// Checks if a user is currently logged in.
  bool isLoggedIn() {
    return sharedPreferences.getBool(StorageConstant.isLoggedIn) ?? false;
  }

  /// Saves the user details to local storage.
  Future<bool> saveUserDetail(UserModel user) async {
    String userJson = jsonEncode(user.toJson());
    await sharedPreferences.setBool(StorageConstant.isLoggedIn, true);
    return await sharedPreferences.setString(StorageConstant.user, userJson);
  }

  /// Removes the user details and access token from local storage.
  void removeUser() {
    sharedPreferences.remove(StorageConstant.user);
    sharedPreferences.remove(StorageConstant.accessToken);
  }

  // Access Token related methods

  /// Saves the access token to local storage.
  Future<bool> saveAccessToken({required String token}) async {
    return await sharedPreferences.setString(
        StorageConstant.accessToken, token);
  }

  /// Retrieves the access token from local storage.
  String get accessToken =>
      sharedPreferences.getString(StorageConstant.accessToken) ?? '';

  // Refresh Token related methods

  /// Saves the refresh token to local storage.
  Future<bool> saveRefreshToken({required String token}) async {
    return await sharedPreferences.setString(
        StorageConstant.refreshToken, token);
  }

  // User related methods

  /// Retrieves the user details from local storage.
  UserModel getUser() {
    final dynamic user = jsonDecode(
        sharedPreferences.getString(StorageConstant.user) ??
            jsonEncode(UserModel.fakeData()));
    return UserModel.fromJson(user);
  }
}
