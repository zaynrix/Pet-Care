import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care/features/home/models/vets_model.dart';
import 'package:pet_care/features/home/widgets/star_rating_widget.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';

class VetCard extends StatelessWidget {
  const VetCard({super.key, this.vet});
  final Vets? vet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 16.paddingRight,
      child: Container(
        width: 150.width,
        height: 180.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Image.network(
                vet!.image!,
                fit: BoxFit.cover,
                width: 150.width,
                height: 180.height,
                errorBuilder: (context, error, stackTrace) => SizedBox(
                  width: 150.width,
                  height: 180.height,
                  child: const Center(
                    child: Icon(Icons.new_releases),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 14,
              bottom: 11,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vet!.name!,
                    style: footNoteBold.copyWith(color: ColorManager.primary),
                  ),
                  4.addVerticalSpace,
                  RatingStars(
                    rating: vet!.review!.toDouble(),
                  ),
                ],
              ),
            ),
            const PositionsCardShadow()
          ],
        ),
      ),
    );
  }
}

class VetCardGrid extends StatelessWidget {
  const VetCardGrid({super.key, this.vet});
  final Vets? vet;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 12.paddingHorizontal,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Image.network(
              vet!.image!,
              fit: BoxFit.cover,
              // width: 150.width,
              height: 600.h,
              errorBuilder: (context, error, stackTrace) => SizedBox(
                // width: 150.width,
                height: 600.h,
                child: const Center(
                  child: Icon(Icons.new_releases),
                ),
              ),
            ),
          ),
          Positioned(
            left: 14,
            bottom: 11,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vet!.name!,
                  style: footNoteBold.copyWith(color: ColorManager.primary),
                ),
                4.addVerticalSpace,
                RatingStars(
                  rating: vet!.review!.toDouble(),
                ),
              ],
            ),
          ),
          const PositionsCardShadow()
        ],
      ),
    );
  }
}

class PositionsCardShadow extends StatelessWidget {
  const PositionsCardShadow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.black.withOpacity(0.0),
            ],
          ),
        ),
        // width: 200.width,
      ),
    );
  }
}
