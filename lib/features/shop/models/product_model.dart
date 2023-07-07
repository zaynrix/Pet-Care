class Product {
  List<SingleProduct>? products;

  Product({this.products});

  Product.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <SingleProduct>[];
      json['products'].forEach((v) {
        products!.add(new SingleProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SingleProduct {
  String? name;
  String? image;
  double? price;
  double? originalPrice;
  int? discountPercentage;
  bool? inCart;
  int? cartQuantity;
  bool? isFavorite;
  List<Pharmacies>? pharmacies;

  SingleProduct(
      {this.name,
      this.image,
      this.price,
      this.originalPrice,
      this.discountPercentage,
      this.inCart,
      this.cartQuantity,
      this.isFavorite,
      this.pharmacies});

  SingleProduct.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    price = json['price'];
    originalPrice = json['originalPrice'];
    discountPercentage = json['discountPercentage'];
    inCart = json['inCart'];
    cartQuantity = json['cartQuantity'];
    isFavorite = json['isFavorite'];
    if (json['pharmacies'] != null) {
      pharmacies = <Pharmacies>[];
      json['pharmacies'].forEach((v) {
        pharmacies!.add(new Pharmacies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['originalPrice'] = this.originalPrice;
    data['discountPercentage'] = this.discountPercentage;
    data['inCart'] = this.inCart;
    data['cartQuantity'] = this.cartQuantity;
    data['isFavorite'] = this.isFavorite;
    if (this.pharmacies != null) {
      data['pharmacies'] = this.pharmacies!.map((v) => v.toJson()).toList();
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
  String? details;

  Pharmacies(
      {this.name,
      this.price,
      this.arriveTime,
      this.deliveryAvailable,
      this.deliveryFee,
      this.details});

  Pharmacies.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    arriveTime = json['arriveTime'];
    deliveryAvailable = json['deliveryAvailable'];
    deliveryFee = json['deliveryFee'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['arriveTime'] = this.arriveTime;
    data['deliveryAvailable'] = this.deliveryAvailable;
    data['deliveryFee'] = this.deliveryFee;
    data['details'] = this.details;
    return data;
  }
}
