import 'dart:convert';

import 'package:pet_care/features/shop/models/product_model.dart';

class ProductRepository {
  Future<Product> getPetShopRepo() async {
    const String response = '''
{
  "products": [
    {
      "id": 1,
      "name": "Dog Treats",
      "coverImage": "https://shop-cdn-m.mediazs.com/bilder/barkoo/kauknochen/gepresst/rinderhaut/8/400/56980_barkoo_kauknochen_gepresst_web_8.jpg",
      "images": [
        "https://shop-cdn-m.mediazs.com/bilder/barkoo/kauknochen/gepresst/rinderhaut/8/400/56980_barkoo_kauknochen_gepresst_web_8.jpg",
        "https://shop-cdn-m.mediazs.com/bilder/barkoo/kauknochen/gepresst/rinderhaut/9/400/barkoo_kauknochen_gepresst_im_vergleich_9.jpg",
        "https://shop-cdn-m.mediazs.com/bilder/barkoo/kauknochen/gepresst/rinderhaut/9/400/barkoo_logo_1_f_r_shop_9.jpg",
        "https://shop-cdn-m.mediazs.com/bilder/barkoo/kauknochen/gepresst/rinderhaut/9/400/56980_pla_barkoo_kauknochen_gepresst_6x15cm_copy_9.jpg"
      ],
      "price": 12.99,
      "originalPrice": 15.99,
      "discountPercentage": 19,
      "inCart": true,
      "cartQuantity": 2,
      "isFavorite": false,
      "details": "Dog Treats details",
      "pharmacies": [
        {
          "id": 1,
          "name": "PetSmart",
          "price": 12.99,
          "arriveTime": "1 day",
          "deliveryAvailable": true,
          "deliveryFee": 3.99
        },
        {
          "id": 2,
          "name": "PetCo",
          "price": 10.99,
          "arriveTime": "2 days",
          "deliveryAvailable": true,
          "deliveryFee": 2.99
        }
      ]
    },
    {
      "id": 2,
      "name": "Cat Litter",
      "coverImage": "https://shop-cdn-m.mediazs.com/bilder/almo/nature/cat/litter/0/400/280296_pla_almo_nature_cat_litter_2_27kg_hs_1_1_0.jpg",
      "images": [
        "https://shop-cdn-m.mediazs.com/bilder/almo/nature/cat/litter/0/400/280296_pla_almo_nature_cat_litter_2_27kg_hs_1_1_0.jpg",
        "https://shop-cdn-m.mediazs.com/bilder/almo/nature/cat/litter/1/400/675565_almonature_catlitter_funktion_1.jpg",
        "https://shop-cdn-m.mediazs.com/bilder/almo/nature/cat/litter/0/400/1_675565_almonature_catlitter_benefits2_0.jpg"
      ],
      "price": 9.99,
      "originalPrice": 11.99,
      "discountPercentage": 17,
      "inCart": false,
      "cartQuantity": 0,
      "isFavorite": true,
      "details": "Cat Litter details",
      "pharmacies": [
        {
          "id": 3,
          "name": "PetLand",
          "price": 9.99,
          "arriveTime": "2 days",
          "deliveryAvailable": true,
          "deliveryFee": 2.99
        },
        {
          "id": 4,
          "name": "PetSmart",
          "price": 8.99,
          "arriveTime": "3 days",
          "deliveryAvailable": true,
          "deliveryFee": 1.99
        }
      ]
    },
    {
      "id": 3,
      "name": "Bird Food",
      "coverImage": "https://shop-cdn-m.mediazs.com/bilder/lillebro/wildvogelfutter/0/400/230762_lillebro_wildvogelf2_0.jpg",
      "images": [
        "https://shop-cdn-m.mediazs.com/bilder/lillebro/wildvogelfutter/0/400/230762_lillebro_wildvogelf2_0.jpg",
        "https://shop-cdn-m.mediazs.com/bilder/lillebro/wildvogelfutter/7/400/_dsc4807_7.jpg",
        "https://shop-cdn-m.mediazs.com/bilder/lillebro/wildvogelfutter/7/400/66883_pla_lillebro_wildvogelfutter_klassisch_20kg_7.jpg"
      ],
      "price": 6.99,
      "originalPrice": 8.99,
      "discountPercentage": 22,
      "inCart": false,
      "cartQuantity": 0,
      "isFavorite": false,
      "details": "Bird Food details",
      "pharmacies": [
        {
          "id": 5,
          "name": "PetLand",
          "price": 6.99,
          "arriveTime": "1 day",
          "deliveryAvailable": true,
          "deliveryFee": 2.99
        },
        {
          "id": 6,
          "name": "PetCo",
          "price": 7.99,
          "arriveTime": "2 days",
          "deliveryAvailable": true,
          "deliveryFee": 1.99
        }
      ]
    }
  ]
}
''';

    Map<String, dynamic> jsonResponse = jsonDecode(response);
    Product product = Product.fromJson(jsonResponse);
    return product;
  }
}
