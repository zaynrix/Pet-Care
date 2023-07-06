part of shop_screens;

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final SizeConfig sizeConfig = sl<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer<ProductController>(
        builder: (context, instance, child) => ElevatedButton(
          child: const Text("Add to cart"),
          onPressed: instance.isFloatingActionButtonEnabled() ? () {} : null,
        ),
      ),
      backgroundColor: ColorManager.soft,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: ColorManager.transparent,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: sizeConfig.getScreenHeight(350),
              decoration: const BoxDecoration(color: ColorManager.soft),
              child: CarouselSlider(
                options: CarouselOptions(
                  aspectRatio: 16 / 14,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                ),
                items:
                    Provider.of<ProductController>(context).productImages.map(
                  (String imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    );
                  },
                ).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: sizeConfig.getScreenWidth(AppSize.s24),
              ),
              width: double.infinity,
              // height: Get.height * 0.5,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.circular(AppSize.s30),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    50.verticalSpace,
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
                    Consumer<ProductController>(
                      builder: (context, instance, child) => ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: instance.pharmacies.length,
                        itemBuilder: (context, index) {
                          Pharmacy pharmacy = instance.pharmacies[index];
                          bool isSelected = instance.selectedCardIndex == index;
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: sizeConfig.getScreenHeight(AppSize.s8),
                            ),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    instance.selectedCardIndex = -1;
                                  } else {
                                    instance.selectedCardIndex = index;
                                  }
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.all(AppSize.s16),
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius:
                                      BorderRadius.circular(AppSize.s8),
                                  border: Border.all(
                                    color:
                                        isSelected ? Colors.green : Colors.grey,
                                    width: isSelected ? 2 : 1,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          pharmacy.title,
                                          style: const TextStyle(
                                            fontSize: AppSize.s16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: AppSize.s8),
                                        Row(
                                          children: [
                                            const Text(
                                              "Arrives:",
                                              style: TextStyle(
                                                fontSize: AppSize.s14,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            5.horizontalSpace,
                                            Text(
                                              "${pharmacy.estimatedArrival}",
                                              style: const TextStyle(
                                                  fontSize: AppSize.s14,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          "\$${pharmacy.price.toStringAsFixed(2)}",
                                          style: const TextStyle(
                                            fontSize: AppSize.s16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: AppSize.s8),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              IconAssets.delivery,
                                              color: pharmacy.deliveryAvailable
                                                  ? ColorManager.secondary
                                                  : Colors.grey,
                                            ),
                                            5.horizontalSpace,
                                            Text(
                                              pharmacy.deliveryFee > 0.0
                                                  ? "Delivery Fee: \$${pharmacy.deliveryFee.toStringAsFixed(2)}"
                                                  : "Free Delivery",
                                              // Display the delivery fee or "Free Delivery"
                                              style: TextStyle(
                                                fontSize: AppSize.s14,
                                                color:
                                                    pharmacy.deliveryAvailable
                                                        ? ColorManager.secondary
                                                        : Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    20.addVerticalSpace,
                    const Text(
                      "Details",
                      style: supTitleBold,
                    ),
                    const Text(
                      "Pro-Sense brand offers a variety of proactive, sensible solutions for all of your pet’s healthcare and wellness needs. We know pet parenting can be tough, which is why we’ve improved our ingredients and benefits to make it easier than ever to care for them like any other member of your family. Your pet can experience allergies just ",
                      style: bodyMedium,
                    ),
                    100.addVerticalSpace,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
