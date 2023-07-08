class Product {
  List<SingleProduct>? products;

  Product({this.products});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <SingleProduct>[];
      json['products'].forEach((v) {
        products!.add(SingleProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SingleProduct {
  String? name;
  String? coverImage;
  List<String>? images;
  double? price;
  double? originalPrice;
  int? discountPercentage;
  bool? inCart;
  int? cartQuantity;
  bool? isFavorite;
  String? details;
  List<Pharmacies>? pharmacies;

  SingleProduct({
    this.name,
    this.coverImage,
    this.images,
    this.price,
    this.originalPrice,
    this.discountPercentage,
    this.inCart,
    this.cartQuantity,
    this.isFavorite,
    this.details,
    this.pharmacies,
  });

  SingleProduct.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    coverImage = json['coverImage'];
    images = json['images'].cast<String>();
    price = json['price'];
    originalPrice = json['originalPrice'];
    discountPercentage = json['discountPercentage'];
    inCart = json['inCart'];
    cartQuantity = json['cartQuantity'];
    isFavorite = json['isFavorite'];
    details = json['details'];
    if (json['pharmacies'] != null) {
      pharmacies = <Pharmacies>[];
      json['pharmacies'].forEach((v) {
        pharmacies!.add(Pharmacies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['coverImage'] = coverImage;
    data['images'] = images;
    data['price'] = price;
    data['originalPrice'] = originalPrice;
    data['discountPercentage'] = discountPercentage;
    data['inCart'] = inCart;
    data['cartQuantity'] = cartQuantity;
    data['isFavorite'] = isFavorite;
    data['details'] = details;
    if (pharmacies != null) {
      data['pharmacies'] = pharmacies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pharmacies {
  String? name;
  double? price;
  String? arriveTime;
  bool? deliveryAvailable;
  double? deliveryFee;

  Pharmacies({
    this.name,
    this.price,
    this.arriveTime,
    this.deliveryAvailable,
    this.deliveryFee,
  });

  Pharmacies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    arriveTime = json['arriveTime'];
    deliveryAvailable = json['deliveryAvailable'];
    deliveryFee = json['deliveryFee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['arriveTime'] = arriveTime;
    data['deliveryAvailable'] = deliveryAvailable;
    data['deliveryFee'] = deliveryFee;
    return data;
  }
}
