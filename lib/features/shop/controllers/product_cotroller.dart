import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pet_care/features/shop/models/pharmacy_model.dart';
import 'package:pet_care/resources/assets_manager.dart';

import '../models/payment_method_model.dart';

class ProductController extends ChangeNotifier {
  List<String> productImages = [
    ImageAssets.productDetails,
    ImageAssets.productDetails,
    ImageAssets.productDetails,
  ];

  List<Pharmacy> pharmacies = [
    Pharmacy(
      title: "Care Pharmacy",
      subtitle: "Subtitle 2",
      estimatedArrival: "13 min",
      price: 14.36,
      deliveryAvailable: false,
      deliveryFee: 0.0, // Free delivery
    ),
    Pharmacy(
      title: "Lydianous Pharmacy",
      subtitle: "Subtitle 2",
      estimatedArrival: "15 min",
      price: 15.36,
      deliveryAvailable: true,
      deliveryFee: 2.0, // Free delivery
    ),
    Pharmacy(
      title: "Lydianous Pharmacy",
      subtitle: "Subtitle 2",
      estimatedArrival: "5 days",
      price: 13.8,
      deliveryAvailable: false,
      deliveryFee: 0.0, // Free delivery
    ),
    // Add more pharmacies here...
  ];

  int selectedCardIndex = -1;

  bool isFloatingActionButtonEnabled() {
    return selectedCardIndex != -1;
  }

  final String jsonString = '''
    [
      {"visatype": "Type A", "id": 1, "visa_last_four": "1234", "payment_method": "Mastercard"},
      {"visatype": "Type B", "id": 2, "visa_last_four": "5678", "payment_method": "Visa"},
      {"visatype": "Type C", "id": 3, "visa_last_four": "9012", "payment_method": "Mastercard"}
    ]
  ''';
  List<PaymentMethodModel> visaList = [];
  int selectedIndexPayment = -1;

  List<PaymentMethodModel> parseJsonData() {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    return parsed
        .map<PaymentMethodModel>((json) => PaymentMethodModel.fromJson(json))
        .toList();
  }

  void selectVisa(int index) {
    if (selectedIndexPayment == index) {
      selectedIndexPayment =
          -1; // Clear selection if the same item is tapped again
      notifyListeners();
    } else {
      selectedIndexPayment = index; // Select the new item
      notifyListeners();
    }
  }
}
