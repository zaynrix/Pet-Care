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
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.0),
            ],
          ),
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
      child: Container(
        // width: 150.width,
        height: 600.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.0),
            ],
          ),
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
    return Positioned(
      bottom: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
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
        height: 100.height,
      ),
    );
  }
}

// class ShodCardGrid extends StatelessWidget {
//   ShodCardGrid({
//     this.singleProduct,
//     this.onTap,
//     Key? key,
//   }) : super(key: key);
//   final SingleProduct? singleProduct;
//   final SizeConfig sizeConfig = sl<SizeConfig>();
//   final Function()? onTap;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: 12.paddingHorizontal,
//       child: Container(
//         height: 600.h,
//         decoration: BoxDecoration(
//           boxShadow: [customShadow()],
//         ),
//         child: Card(
//           elevation: 0,
//           color: ColorManager.white,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15.0),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.only(
//                         left: 24, right: 24, top: 14, bottom: 10),
//                     child: Hero(
//                       tag: singleProduct!.id!,
//                       child: Image.network(
//                         singleProduct!.coverImage!,
//                         fit: BoxFit.fitWidth,
//                         height: 120,
//                         width: 120.w,
//                         errorBuilder: (context, error, stackTrace) => SizedBox(
//                           height: 120,
//                           width: 120.w,
//                           child: const Center(
//                             child: Icon(Icons.new_releases),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     bottom: 10,
//                     left: 10.5,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 10.0,
//                         vertical: 4.0,
//                       ),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFDFD4FB),
//                         borderRadius: BorderRadius.circular(50.0),
//                       ),
//                       child: Text(
//                         "%${singleProduct!.discountPercentage} OFF ",
//                         style: const TextStyle(
//                           color: ColorManager.primary,
//                           fontSize: 10.0,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               // const RVerticalSpace(height: AppSize.s10),
//               Padding(
//                 padding: 10.paddingHorizontal,
//                 child: Text(
//                   "${singleProduct!.name}",
//                   style: footNoteRegular(color: ColorManager.primary),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.start,
//                 ),
//               ),
//               Padding(
//                 padding: 10.paddingHorizontal,
//                 child: Row(
//                   children: [
//                     Text(
//                       "\$${singleProduct!.price}",
//                       style: footNoteBold,
//                     ),
//                     const RHorizontalSpace(width: AppSize.s5),
//                     Text(
//                       "\$${singleProduct!.originalPrice}",
//                       style: oldPriceStyle,
//                     ),
//                     const Spacer(),
//                     GestureDetector(
//                         onTap: onTap,
//                         child: Icon(
//                           singleProduct!.inCart == true
//                               ? Icons.add_circle
//                               : Icons.remove_circle_outline_rounded,
//                           color: ColorManager.secondary,
//                         )),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       )
//           .animate(delay: 200.ms)
//           .moveY(begin: -100)
//           .then()
//           .shakeY(hz: 4, amount: 3),
//     );
//   }
// }
