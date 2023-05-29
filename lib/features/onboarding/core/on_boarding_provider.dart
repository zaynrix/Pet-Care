import 'package:flutter/material.dart';
class OnBoardingProvider extends ChangeNotifier{
  final PageController controller = PageController();
  int activeIndex = 0;
  int currantPage = 0;

  void initStateOnBoarding(){
    controller.addListener(() {
      activeIndex = controller.page!.round();
      notifyListeners();
    });
  }

  onoPageChange(int value){
    currantPage = value;
    notifyListeners();
  }
}