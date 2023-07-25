import 'package:flutter/material.dart';

class OrderInformationProvide extends ChangeNotifier {
  bool isShow = false;
  bool showPromotionResult = false;

  TextEditingController promotionsCodeController = TextEditingController();

  change({bool? show}) {
    isShow = show!;
    notifyListeners();
  }

  showPromotion({bool? show}) {
    showPromotionResult = show!;
    notifyListeners();
  }
}
