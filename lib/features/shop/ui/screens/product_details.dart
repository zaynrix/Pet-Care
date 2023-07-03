part of shop_screens;

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final SizeConfig sizeConfig = sl<SizeConfig>();

  List<String> productImages = [
    ImageAssets.productDetails,
    ImageAssets.productDetails,
    ImageAssets.productDetails,
  ];

  List<Pharmacy> pharmacies = [
    Pharmacy(
      title: "Care Pharmacy",
      subtitle: "Subtitle 1",
      estimatedArrival: "2 days",
      price: 13.8,
      deliveryAvailable: true,
      deliveryFee: 5.0, // Example delivery fee
    ),
    Pharmacy(
      title: "Lydianous Pharmacy",
      subtitle: "Subtitle 2",
      estimatedArrival: "5 days",
      price: 13.8,
      deliveryAvailable: false,
      deliveryFee: 0.0, // Free delivery
    ),
    // Add more pharmacies here...
  ];

  int selectedCardIndex = -1;

  bool isFloatingActionButtonEnabled() {
    return selectedCardIndex != -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
          child: Text("Add to cart"),
          onPressed: isFloatingActionButtonEnabled() ? () {} : null,
        ),
        backgroundColor: ColorManager.soft,
        appBar: AppBar(
          title: const Text("Details"),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back),
          ),
          actions: [
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(AppSize.s10),
                height: sizeConfig.getScreenHeight(AppSize.s44),
                width: sizeConfig.getScreenWidth(AppSize.s44),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: ColorManager.primaryWithTransparent30,
                    width: 1,
                  ),
                ),
                child: SvgPicture.asset(IconAssets.unSelectedCart),
              ),
            ),
            const RHorizontalSpace(width: AppSize.s20),
          ],
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: sizeConfig.getScreenWidth(AppSize.s24),
            ),
            height: sizeConfig.getScreenHeight(AppSize.s300),
            width: double.infinity,
            decoration: const BoxDecoration(color: ColorManager.soft),
            child: CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                viewportFraction: 1.0,
                enableInfiniteScroll: false,
              ),
              items: productImages.map((String imagePath) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: sizeConfig.getScreenWidth(AppSize.s24),
            ),
            width: double.infinity,
            height: Get.height * 0.5,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(AppSize.s30),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(
                        "Pro-Sense Itch & Allergy Solutions",
                        style: supTitleBold,
                        maxLines: 2,
                      ),
                    ),
                    const Spacer(),
                    CustomIconButton(iconPath: IconAssets.likeUnselected),
                  ],
                ),
                const RVerticalSpace(height: AppSize.s10),
                const Text(
                  "Choose the pharmacy",
                  style: captionRegular,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: pharmacies.length,
                  itemBuilder: (context, index) {
                    Pharmacy pharmacy = pharmacies[index];
                    bool isSelected = selectedCardIndex == index;
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        // horizontal: sizeConfig.getScreenWidth(AppSize.s24),
                        vertical: sizeConfig.getScreenHeight(AppSize.s8),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedCardIndex = -1;
                            } else {
                              selectedCardIndex = index;
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(AppSize.s16),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(AppSize.s8),
                            border: Border.all(
                              color: isSelected ? Colors.green : Colors.grey,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pharmacy.title,
                                    style: TextStyle(
                                      fontSize: AppSize.s16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: AppSize.s8),
                                  Text(
                                    "Arrives: ${pharmacy.estimatedArrival}",
                                    style: TextStyle(
                                      fontSize: AppSize.s14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "\$${pharmacy.price.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: AppSize.s16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: AppSize.s8),
                                  Text(
                                    pharmacy.deliveryFee > 0.0
                                        ? "Delivery Fee: \$${pharmacy.deliveryFee.toStringAsFixed(2)}"
                                        : "Free Delivery",
                                    // Display the delivery fee or "Free Delivery"
                                    style: TextStyle(
                                      fontSize: AppSize.s14,
                                      color: pharmacy.deliveryAvailable
                                          ? Colors.green
                                          : Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ])));
  }
}

class Pharmacy {
  final String title;
  final String subtitle;
  final String estimatedArrival;
  final double price;
  final bool deliveryAvailable;
  final double deliveryFee; // New field for delivery fee

  // Constructor with the new deliveryFee parameter
  Pharmacy({
    required this.title,
    required this.subtitle,
    required this.estimatedArrival,
    required this.price,
    required this.deliveryAvailable,
    required this.deliveryFee,
  });
}

//
// class ProductDetailsScreen extends StatelessWidget {
//   ProductDetailsScreen({Key? key}) : super(key: key);
//
//   final SizeConfig sizeConfig = sl<SizeConfig>();
//
//   List<String> productImages = [
//     ImageAssets.productDetails,
//     ImageAssets.productDetails,
//     ImageAssets.productDetails,
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       floatingActionButton: ElevatedButton(
//         child: Text("Add to cart"),
//         onPressed: () {},
//       ),
//       backgroundColor: ColorManager.soft,
//       appBar: AppBar(
//         title: const Text("Details"),
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.arrow_back),
//         ),
//         actions: [
//           InkWell(
//             child: Container(
//               padding: const EdgeInsets.all(AppSize.s10),
//               height: sizeConfig.getScreenHeight(AppSize.s44),
//               width: sizeConfig.getScreenWidth(AppSize.s44),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(
//                   color: ColorManager.primaryWithTransparent30,
//                   width: 1,
//                 ),
//               ),
//               child: SvgPicture.asset(IconAssets.unSelectedCart),
//             ),
//           ),
//           const RHorizontalSpace(width: AppSize.s20),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: sizeConfig.getScreenWidth(AppSize.s24),
//               ),
//               height: sizeConfig.getScreenHeight(AppSize.s300),
//               width: double.infinity,
//               decoration: const BoxDecoration(color: ColorManager.soft),
//               child: CarouselSlider(
//                 options: CarouselOptions(
//                   aspectRatio: 16 / 9,
//                   viewportFraction: 1.0,
//                   enableInfiniteScroll: false,
//                 ),
//                 items: productImages.map((String imagePath) {
//                   return Builder(
//                     builder: (BuildContext context) {
//                       return Image.asset(
//                         imagePath,
//                         fit: BoxFit.cover,
//                       );
//                     },
//                   );
//                 }).toList(),
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: sizeConfig.getScreenWidth(AppSize.s24),
//               ),
//               width: double.infinity,
//               height: Get.height * 0.5,
//               decoration: BoxDecoration(
//                 color: ColorManager.white,
//                 borderRadius: BorderRadius.circular(AppSize.s30),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       const Expanded(
//                         child: Text(
//                           "Pro-Sense Itch & Allergy Solutions",
//                           style: supTitleBold,
//                           maxLines: 2,
//                         ),
//                       ),
//                       const Spacer(),
//                       CustomIconButton(iconPath: IconAssets.likeUnselected),
//                     ],
//                   ),
//                   const RVerticalSpace(height: AppSize.s10),
//                   const Text(
//                     "Choose the pharmacy",
//                     style: captionRegular,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: sizeConfig.getScreenHeight(AppSize.s60),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(AppSize.s8),
//                       border: Border.all(
//                         color: ColorManager.primaryWithTransparent30,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
