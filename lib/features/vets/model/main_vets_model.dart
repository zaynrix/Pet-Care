import 'package:pet_care/features/vets/model/reviews.dart';

class MainVetsModel {
  MainVetsModel({
    required this.name,
    required this.id,
    required this.price,
    required this.completedService,
    required this.experienceYears,
    required this.image,
    required this.pio,
    required this.reviews,
    required this.rating,
    required this.countRating,
  });

  final String name;
  final String id;
  final String image;
  final double price;
  final double rating;
  final String pio;
  final int experienceYears;
  final int completedService;
  final List<ReviewsModel> reviews;
  final int countRating;

  factory MainVetsModel.fromJson(Map<String, dynamic> json) {
    var reviewsList = json['reviews'] as List;
    List<ReviewsModel> reviews = reviewsList
        .map((reviewJson) => ReviewsModel.fromJson(reviewJson))
        .toList();

    return MainVetsModel(
      name: json['name'],
      id: json['id'],
      image: json['image'],
      price: json['price'].toDouble(),
      pio: json['pio'],
      experienceYears: json['experienceYears'],
      completedService: json['completedService'],
      reviews: reviews,
      rating: json["rating"],
      countRating: json["countRating"]
    );
  }
}
