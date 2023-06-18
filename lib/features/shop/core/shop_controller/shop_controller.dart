import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopController extends GetxController {

  RxInt currantBannerCard = 0.obs;
  Timer? timer;

  final PageController bannerCardController = PageController(
    initialPage: 0,
  );

  updateCurrantBannerCard(int page){
    currantBannerCard(page);
  }
  initPharmacyShopState(){
    debugPrint("This is inside init in controller");
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      debugPrint("This is inside timer in controller");
      if (currantBannerCard < 2) {
        debugPrint("This is inside if in controller");
        currantBannerCard(currantBannerCard.value +1);
      } else {
        currantBannerCard.value = 0;
      }
      bannerCardController.animateToPage(
        currantBannerCard.value,
        duration: const Duration(milliseconds: 350),
        curve: Curves.linearToEaseOut,
      );
    });
  }

  disposePharmacyState(){
    timer!.cancel();
  }


}