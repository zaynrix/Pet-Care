import 'package:flutter/material.dart';
import 'package:pet_care/resources/colors_manager.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double size;

  const RatingStars({required this.rating, this.size = 14});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          Icons.star,
          size: size,
          color: index < rating.floor() ? ColorManager.star : ColorManager.gray,
        );
      }),
    );
  }
}
