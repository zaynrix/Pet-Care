import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier{
  int currantAuthTap = 0;
  changeCurrantTap(int index) {
    currantAuthTap = index;
    notifyListeners();
  }
}