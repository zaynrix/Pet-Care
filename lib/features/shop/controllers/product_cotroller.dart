import 'package:flutter/cupertino.dart';
import 'package:pet_care/features/shop/models/pharmacy_model.dart';
import 'package:pet_care/resources/assets_manager.dart';

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
}
