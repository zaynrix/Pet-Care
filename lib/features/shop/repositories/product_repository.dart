import 'dart:convert';

import 'package:pet_care/features/shop/models/product_model.dart';

class ProductRepository {
  Future<Product> getBestSellerRepo() async {
    const String response = '''
    {
      "products": [
        {
          "name": "Product 1",
          "image": "image_url_1",
          "price": 10.99,
          "originalPrice": 14.99,
          "discountPercentage": 27,
          "inCart": true,
          "cartQuantity": 2,
          "isFavorite": false,
          
          "pharmacies": [
            {
              "name": "Pharmacy 1",
              "price": 10.99,
              "arriveTime": "2 days",
              "deliveryAvailable": true,
              "deliveryFee": 2.99,
              "details": "Product 1 details from Pharmacy 1"
            }, {
              "name": "Pharmacy 1",
              "price": 10.99,
              "arriveTime": "2 days",
              "deliveryAvailable": true,
              "deliveryFee": 2.99,
              "details": "Product 1 details from Pharmacy 1"
            }, {
              "name": "Pharmacy 1",
              "price": 10.99,
              "arriveTime": "2 days",
              "deliveryAvailable": true,
              "deliveryFee": 2.99,
              "details": "Product 1 details from Pharmacy 1"
            },{
              "name": "Pharmacy 1",
              "price": 10.99,
              "arriveTime": "2 days",
              "deliveryAvailable": true,
              "deliveryFee": 2.99,
              "details": "Product 1 details from Pharmacy 1"
            },{
              "name": "Pharmacy 1",
              "price": 10.99,
              "arriveTime": "2 days",
              "deliveryAvailable": true,
              "deliveryFee": 2.99,
              "details": "Product 1 details from Pharmacy 1"
            },{
              "name": "Pharmacy 1",
              "price": 10.99,
              "arriveTime": "2 days",
              "deliveryAvailable": true,
              "deliveryFee": 2.99,
              "details": "Product 1 details from Pharmacy 1"
            },{
              "name": "Pharmacy 1",
              "price": 10.99,
              "arriveTime": "2 days",
              "deliveryAvailable": true,
              "deliveryFee": 2.99,
              "details": "Product 1 details from Pharmacy 1"
            },{
              "name": "Pharmacy 1",
              "price": 10.99,
              "arriveTime": "2 days",
              "deliveryAvailable": true,
              "deliveryFee": 2.99,
              "details": "Product 1 details from Pharmacy 1"
            },{
              "name": "Pharmacy 1",
              "price": 10.99,
              "arriveTime": "2 days",
              "deliveryAvailable": true,
              "deliveryFee": 2.99,
              "details": "Product 1 details from Pharmacy 1"
            },{
              "name": "Pharmacy 1",
              "price": 10.99,
              "arriveTime": "2 days",
              "deliveryAvailable": true,
              "deliveryFee": 2.99,
              "details": "Product 1 details from Pharmacy 1"
            },{
              "name": "Pharmacy 1",
              "price": 10.99,
              "arriveTime": "2 days",
              "deliveryAvailable": true,
              "deliveryFee": 2.99,
              "details": "Product 1 details from Pharmacy 1"
            },{
              "name": "Pharmacy 1",
              "price": 10.99,
              "arriveTime": "2 days",
              "deliveryAvailable": true,
              "deliveryFee": 2.99,
              "details": "Product 1 details from Pharmacy 1"
            },{
              "name": "Pharmacy 1",
              "price": 10.99,
              "arriveTime": "2 days",
              "deliveryAvailable": true,
              "deliveryFee": 2.99,
              "details": "Product 1 details from Pharmacy 1"
            },{
              "name": "Pharmacy 1",
              "price": 10.99,
              "arriveTime": "2 days",
              "deliveryAvailable": true,
              "deliveryFee": 2.99,
              "details": "Product 1 details from Pharmacy 1"
            },
            {
              "name": "Pharmacy 2",
              "price": 12.99,
              "arriveTime": "3 days",
              "deliveryAvailable": false,
              "deliveryFee": 0.0,
              "details": "Product 1 details from Pharmacy 2"
            }
          ]
        },
        {
          "name": "Product 2",
          "image": "image_url_2",
          "price": 8.5,
          "originalPrice": 10.0,
          "discountPercentage": 15,
          "inCart": false,
          "cartQuantity": 0,
          "isFavorite": true,
          "pharmacies": [
            {
              "name": "Pharmacy 3",
              "price": 8.5,
              "arriveTime": "1 day",
              "deliveryAvailable": true,
              "deliveryFee": 1.99,
              "details": "Product 2 details from Pharmacy 3"
            }
          ]
        }
      ]
    }
  ''';
    Map<String, dynamic> jsonResponse = jsonDecode(response);
    List<Map<String, dynamic>> productsJson =
        jsonResponse['products'].cast<Map<String, dynamic>>();
    // List<Product> products = productsJson.map((productJson) => Product.fromJson(productJson)).toList();

    Product product = Product.fromJson(jsonResponse);
    return product;
  }
}
