import 'dart:convert';

import 'package:pet_care/data/local_data/storage_constant.dart';
import 'package:pet_care/features/auth/auth_model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  StorageService(this.sharedPreferences);
  final SharedPreferences sharedPreferences;



  bool isLoggedIn() {
    return sharedPreferences.getBool("isLoggedIn") ?? false;
  }

  Future<bool> saveUserDetail(UserModel user) async {
    String userJson = jsonEncode(user.toJson());
    await sharedPreferences.setBool(StorageConstant.isLoggedIn, true);
    return await sharedPreferences.setString(StorageConstant.user, userJson);
  }


  Future<bool> saveAccessToken({required String token}) async {
    return await sharedPreferences.setString(StorageConstant.accessToken, token);
  }

  Future<bool> saveRefreshToken({required String token}) async {
    return await sharedPreferences.setString(StorageConstant.refreshToken, token);
  }


  getUser()  {
    final dynamic user = jsonDecode(sharedPreferences.getString(StorageConstant.user) ?? jsonEncode(UserModel.fakeData()));
    return UserModel.fromJson(user);
  }

  String get accessToken => sharedPreferences.getString(StorageConstant.accessToken) ?? '';


}


