import 'package:flutter/cupertino.dart';
import 'package:pet_care/data/local_data/storage_service.dart';
import 'package:pet_care/features/auth/auth_repo/auth_repo.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/routing/routing_module.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider(this.repo);

  final AuthRepo repo;
  int currantAuthTap = 0;
  bool isLoading = false;

  changeCurrantTap(int index) {
    currantAuthTap = index;
    notifyListeners();
  }


  Future<dynamic> login(
      {required String email, required String password}) async {
    try {
      isLoading = true;
      notifyListeners();
      final user = await repo.loginRepo(email: email, password: password);
      sl<StorageService>().saveUserDetail(user);
      isLoading = false;
      notifyListeners();
      RouteService.serviceNavi.pushNamedReplacement(RouteGenerator.homeScreen);
    } catch (e){
      debugPrint("This is the error $e");
      isLoading = false;
      notifyListeners();
    }
  }
}
