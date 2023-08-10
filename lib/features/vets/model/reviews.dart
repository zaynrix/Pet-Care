import 'package:pet_care/utils/extension/time_extension.dart';

class ReviewsModel{
  ReviewsModel({
    required this.content,
    required this.createdAt,
    required this.rate,
    required this.reviewsBy
});
  final double rate;
  final String content;
  final String reviewsBy;
  final String createdAt;

  factory ReviewsModel.fromJson(Map<String , dynamic> json) =>
      ReviewsModel(
          content: json["content"],
          createdAt: json["createdAt"].toString().convertToDate()!,
          rate: json["rate"],
          reviewsBy: json["reviewsBy"]);
}