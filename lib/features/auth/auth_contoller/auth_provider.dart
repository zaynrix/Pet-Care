import 'package:flutter/material.dart';
import 'package:pet_care/data/local_data/storage_service.dart';
import 'package:pet_care/features/auth/auth_repo/auth_repo.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/enums.dart';
import 'package:pet_care/utils/helper.dart';

class AuthProvider extends ChangeNotifier {
  final repo = sl<AuthRepo>();
  var shared = sl<StorageService>();
  int currantAuthTap = 0;
  bool isLoading = false;

  late TabController tabController;

  changeCurrantTap(int index) {
    currantAuthTap = index;
    notifyListeners();
  }

  void changeTab(int index) {
    if (tabController.index != index) {
      tabController.animateTo(index);
    }
  }

  Future<dynamic> login(
      {required String email, required String password}) async {
    try {
      isLoading = true;
      notifyListeners();
      final user = await repo.loginRepo(email: email, password: password);
      shared.saveUserDetail(user);
      debugPrint("This is accessToken ${sl<StorageService>().accessToken}");
      isLoading = false;
      notifyListeners();
      RouteService.serviceNavi
          .pushNamedReplacement(RouteGenerator.addNewLocation);
    } catch (e) {
      debugPrint("This is the error $e");
      isLoading = false;
      notifyListeners();
    }
  }

  Future<dynamic> signup(
      {required String email,
      required String name,
      required String password,
      required String phoneNumber}) async {
    try {
      isLoading = true;
      notifyListeners();
      await repo.signupRepo(
          email: email,
          name: name,
          password: password,
          phoneNumber: phoneNumber);
      isLoading = false;
      notifyListeners();
      Helpers.showDialog(
          message: "Process Successful", status: LoadingStatusOption.success);
      changeTab(0);
    } catch (e) {
      debugPrint("This is the error $e");
      isLoading = false;
      notifyListeners();
    }
  }
}
