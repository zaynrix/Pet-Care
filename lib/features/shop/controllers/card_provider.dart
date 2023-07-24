import 'package:flutter/widgets.dart';

class CardProvider extends ChangeNotifier {
  TextEditingController labelController = TextEditingController();
  TextEditingController holderNameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController mmYy = TextEditingController();
  TextEditingController cVV = TextEditingController();

  String holderName = "HOLDER NAME";
  String visaNumber = "0000 0000 0000 0000";
  initController() {
    labelController = TextEditingController();
    holderNameController = TextEditingController();
    numberController = TextEditingController();
    mmYy = TextEditingController();
    cVV = TextEditingController();
    holderName = "HOLDER NAME";
    visaNumber = "0000 0000 0000 0000";
  }

  disposeController() {
    labelController.dispose();
    holderNameController.dispose();
    numberController.dispose();
    mmYy.dispose();
    cVV.dispose();
  }

  cardListener() {
    numberController.addListener(() {
      visaNumber = numberController.text;
      notifyListeners();
    });

    holderNameController.addListener(() {
      holderName = holderNameController.text;
      notifyListeners();
    });
  }
}
