part of shop_widgets;

class ShodCard extends StatelessWidget {
  ShodCard({
    this.singleProduct,
    Key? key,
  }) : super(key: key);
  final SingleProduct? singleProduct;
  final SizeConfig sizeConfig = sl<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(
        start: sizeConfig.getScreenWidth(AppSize.s18),
      ),
      decoration: BoxDecoration(
        boxShadow: [customShadow()],
      ),
      child: Card(
        elevation: 0,
        color: ColorManager.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: sizeConfig.getScreenWidth(AppSize.s10),
            vertical: sizeConfig.getScreenHeight(AppSize.s14),
          ),
          // height: sizeConfig.getScreenHeight(AppSize.s213),
          width: sizeConfig.getScreenWidth(AppSize.s150),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Hero(
                    tag: singleProduct!.coverImage!,
                    child: Image.network(
                      singleProduct!.coverImage!,
                      fit: BoxFit.fitWidth,
                      width: MediaQuery.of(context).size.width - 12,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6.0,
                        vertical: 2.0,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFDFD4FB),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Text(
                        "%${singleProduct!.discountPercentage} OFF ",
                        style: const TextStyle(
                          color: ColorManager.primary,
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // const RVerticalSpace(height: AppSize.s10),
              Expanded(
                child: Text(
                  "${singleProduct!.name}",
                  style: footNoteRegular(color: ColorManager.primary),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                ),
              ),
              AppSize.s10.addVerticalSpace,
              Row(
                children: [
                  Text(
                    "\$${singleProduct!.price}",
                    style: footNoteBold,
                  ),
                  const RHorizontalSpace(width: AppSize.s5),
                  Text(
                    "\$${singleProduct!.originalPrice}",
                    style: oldPriceStyle,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: sizeConfig.getScreenWidth(AppSize.s25),
                      height: sizeConfig.getScreenHeight(AppSize.s25),
                      padding: const EdgeInsets.all(AppSize.s6),
                      decoration: const BoxDecoration(
                        color: ColorManager.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        singleProduct!.inCart == true
                            ? IconAssets.plus
                            : IconAssets.decrementButton,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// class ShodCard extends StatelessWidget {
//   ShodCard({
//     this.singleProduct,
//     Key? key,
//   }) : super(key: key);
//   final SingleProduct? singleProduct;
//   final SizeConfig sizeConfig = sl<SizeConfig>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsetsDirectional.only(
//         start: sizeConfig.getScreenWidth(AppSize.s18),
//       ),
//       decoration: BoxDecoration(
//         boxShadow: [customShadow()],
//       ),
//       child: Card(
//         elevation: 0,
//         color: ColorManager.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15.0),
//         ),
//         child: Container(
//           padding: EdgeInsets.symmetric(
//             horizontal: sizeConfig.getScreenWidth(AppSize.s10),
//             vertical: sizeConfig.getScreenHeight(AppSize.s14),
//           ),
//           // height: sizeConfig.getScreenHeight(AppSize.s213),
//           width: sizeConfig.getScreenWidth(AppSize.s150),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Stack(
//                 children: [
//                   Image.network(singleProduct!.coverImage!),
//                   Positioned(
//                     bottom: 0,
//                     left: 0,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 6.0,
//                         vertical: 2.0,
//                       ),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFDFD4FB),
//                         borderRadius: BorderRadius.circular(5.0),
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
//               const RVerticalSpace(height: AppSize.s10),
//               Flexible(
//                 child: Text(
//                   "${singleProduct!.name}",
//                   style: footNoteRegular(color: ColorManager.primary),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   textAlign: TextAlign.start,
//                 ),
//               ),
//               AppSize.s10.addVerticalSpace,
//               Row(
//                 children: [
//                   Text(
//                     "\$${singleProduct!.price}",
//                     style: footNoteBold,
//                   ),
//                   const RHorizontalSpace(width: AppSize.s5),
//                   Text(
//                     "\$${singleProduct!.originalPrice}",
//                     style: oldPriceStyle,
//                   ),
//                   const Spacer(),
//                   GestureDetector(
//                     onTap: () {},
//                     child: Container(
//                       width: sizeConfig.getScreenWidth(AppSize.s25),
//                       height: sizeConfig.getScreenHeight(AppSize.s25),
//                       padding: const EdgeInsets.all(AppSize.s6),
//                       decoration: const BoxDecoration(
//                         color: ColorManager.secondary,
//                         shape: BoxShape.circle,
//                       ),
//                       child: SvgPicture.asset(
//                         singleProduct!.inCart == true
//                             ? IconAssets.plus
//                             : IconAssets.decrementButton,
//                         color: ColorManager.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
