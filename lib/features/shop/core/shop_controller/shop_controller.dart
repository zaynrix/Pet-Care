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
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (currantBannerCard < 2) {
        currantBannerCard(currantBannerCard.value++);
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