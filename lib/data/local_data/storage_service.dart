import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:pet_care/data/local_data/storage_constant.dart';
import 'package:pet_care/features/auth/auth-model/user_model.dart';

class StorageService {
  StorageService(this.secureStorage);
  final FlutterSecureStorage secureStorage;

  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );

  Future<void> saveUserDetail(UserModel user) async {
    String userJson = jsonEncode(user.toJson());
    await secureStorage.write(key: StorageConstant.isLoggedIn, value: "true");
    await secureStorage.write(
        key: StorageConstant.user, value: userJson, aOptions: _getAndroidOptions());
  }

  Future<void> saveAccessToken({required String token}) async{
    await secureStorage.write(key: StorageConstant.accessToken, value: token , aOptions: _getAndroidOptions());
  }

  Future<void> deleteAllSecureData() async {
    await secureStorage.deleteAll(aOptions: _getAndroidOptions());
  }


}


