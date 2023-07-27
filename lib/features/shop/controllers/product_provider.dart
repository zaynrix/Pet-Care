import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pet_care/features/shop/models/pharmacy_model.dart';
import 'package:pet_care/features/shop/models/product_model.dart';
import 'package:pet_care/features/shop/repositories/product_repository.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/helper.dart';

import '../models/payment_method_model.dart';

class ProductProvider extends ChangeNotifier {
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

  late Function(GlobalKey) runAddToCartAnimation;
  int selectedCardIndex = -1;
  List<SingleProduct> cartList = [];

  Product? products;
  bool isLoading = false;
  String jsonString = '''
    [
      {"visatype": "Type A", "id": 1, "visa_last_four": "1234", "payment_method": "Mastercard"},
      {"visatype": "Type B", "id": 2, "visa_last_four": "5678", "payment_method": "Visa"},
      {"visatype": "Type C", "id": 3, "visa_last_four": "9012", "payment_method": "Mastercard"}
    ]
  ''';
  List<PaymentMethodModel> visaList = [];
  int selectedIndexPayment = -1;
  SingleProduct? singleProduct;
  int cartLength = 0;

  List<PaymentMethodModel> parseJsonData() {
    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
    notifyListeners();

    return parsed
        .map<PaymentMethodModel>((json) => PaymentMethodModel.fromJson(json))
        .toList();
  }

  bool isFloatingActionButtonEnabled() {
    return selectedCardIndex != -1;
  }

  void selectVisa(int index) {
    if (selectedIndexPayment == index) {
      selectedIndexPayment =
          -1; // Clear selection if the same item is tapped again
    } else {
      selectedIndexPayment = index; // Select the new item
    }
    notifyListeners();
  }

  Future<void> getPetShopProvider() async {
    isLoading = true;
    try {
      Product res = await sl<ProductRepository>().getPetShopRepo();
      products = res;
    } on DioException catch (e) {
      debugPrint("$e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setProductObject({SingleProduct? current}) {
    print("${current!.inCart}");
    isLoading = true;
    notifyListeners();
    singleProduct = current;
    isLoading = false;
    notifyListeners();

    print(singleProduct!.originalPrice);
    RouteService.serviceNavi.pushNamedWidget(
      RouteGenerator.productDetailsScreen,
    );
  }

  void addToCart(SingleProduct singleProduct) {
    bool itemAlreadyInCart =
        cartList.any((element) => element.id == singleProduct.id);
    if (itemAlreadyInCart) {
      Helpers.showSnackBar(message: "The Item Already in Cart");
    } else {
      cartList.add(singleProduct);
      cartLength++;
      notifyListeners();
    }
  }

  void deleteFromCart(SingleProduct singleProduct) {
    bool itemAlreadyInCart =
        cartList.any((element) => element.id == singleProduct.id);
    if (itemAlreadyInCart) {
      Helpers.showSnackBar(message: "The Item is not in Cart");
    } else {
      cartList.remove(singleProduct);
      cartLength--;
      notifyListeners();
    }
  }

  incrementProduct(SingleProduct item) {
    final index = cartList.indexOf(item);
    if (index != -1) {
      cartList[index] =
          SingleProduct(name: item.name, cartQuantity: item.cartQuantity! + 1);
      notifyListeners();
    }
  }

  decrementProduct() {}

  // ---------------------------------- Products Details Logic ----------------------------
  int productQuantity = 1;

  incrementProductDetails() {
    productQuantity++;
    notifyListeners();
  }

  decrementProductDetails() {
    if (productQuantity > 1) {
      productQuantity--;
      notifyListeners();
    }
  }

// ---------------------------------- Order Informations Logic ----------------------------
}
