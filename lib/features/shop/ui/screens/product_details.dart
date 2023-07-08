part of shop_screens;

class ProductDetailsScreen extends StatefulWidget {
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with SingleTickerProviderStateMixin {
  final SizeConfig sizeConfig = sl<SizeConfig>();
  bool likeSelected = false;
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this, value: 1.0);
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soft,
      // New Sliver Appbar
      body: Consumer<ProductController>(
        builder: (context, value, child) => value.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: ColorManager.transparent,
                    title: Text("Details"),
                    // leading: IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(Icons.arrow_back),
                    // ),
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
                    floating: true,
                    expandedHeight: sizeConfig.getScreenHeight(412),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        height: sizeConfig.getScreenHeight(412),
                        width: Get.width,
                        decoration:
                            const BoxDecoration(color: ColorManager.soft),
                        child: CarouselSlider(
                          options: CarouselOptions(
                            aspectRatio: 1 / 1,
                            viewportFraction: 1.0,
                            enableInfiniteScroll: false,
                          ),
                          items: Provider.of<ProductController>(context)
                              .singleProduct!
                              .images!
                              .map(
                                (String imagePath) => Builder(
                                  builder: (BuildContext context) {
                                    return Hero(
                                      tag: value.singleProduct!.coverImage!,
                                      child: Image.network(
                                        imagePath,
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      ),
                                    );
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: sizeConfig.getScreenWidth(AppSize.s24),
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(AppSize.s30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          50.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${value.singleProduct?.name}",
                                  style: supTitleBold,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Spacer(),
                              ScaleTransition(
                                scale: Tween(begin: 0.3, end: 1.0).animate(
                                    CurvedAnimation(
                                        parent: _controller,
                                        curve: Curves.easeOut)),
                                child: CustomIconButton(
                                  onTap: () {
                                    setState(() {
                                      value.singleProduct?.isFavorite =
                                          !value.singleProduct!.isFavorite!;
                                      _controller.reverse().then(
                                          (value) => _controller.forward());
                                    });
                                  },
                                  iconPath:
                                      value.singleProduct?.isFavorite == true
                                          ? IconAssets.likeSelected
                                          : IconAssets.likeUnselected,
                                ),
                              ),
                            ],
                          ),
                          const RVerticalSpace(height: AppSize.s10),
                          const Text(
                            "Choose the pharmacy",
                            style: captionRegular,
                          ),
                          ListView.builder(
                            cacheExtent: 1,
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: value.singleProduct!.pharmacies!.length,
                            itemBuilder: (context, index) {
                              Pharmacies pharmacy =
                                  value.singleProduct!.pharmacies![index];
                              bool isSelected =
                                  value.selectedCardIndex == index;
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      sizeConfig.getScreenHeight(AppSize.s8),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (isSelected) {
                                        value.selectedCardIndex = -1;
                                      } else {
                                        value.selectedCardIndex = index;
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
                                        color: isSelected
                                            ? Colors.green
                                            : Colors.grey,
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
                                              pharmacy.name!,
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
                                                  pharmacy.arriveTime!,
                                                  style: const TextStyle(
                                                      fontSize: AppSize.s14,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                            .animate()
                                            .scaleXY(begin: 0.1, delay: 350.ms),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              "\$${pharmacy.price!.toStringAsFixed(2)}",
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
                                                  color: pharmacy
                                                          .deliveryAvailable!
                                                      ? ColorManager.secondary
                                                      : Colors.grey,
                                                ),
                                                5.horizontalSpace,
                                                Text(
                                                  pharmacy.deliveryFee! > 0.0
                                                      ? "Delivery Fee: \$${pharmacy.deliveryFee!.toStringAsFixed(2)}"
                                                      : "Free Delivery",
                                                  // Display the delivery fee or "Free Delivery"
                                                  style: TextStyle(
                                                    fontSize: AppSize.s14,
                                                    color: pharmacy
                                                            .deliveryAvailable!
                                                        ? ColorManager.secondary
                                                        : Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                            .animate(delay: 200.ms)
                                            .moveX(begin: -100)
                                            .then()
                                            .shakeX(hz: 4, amount: 3),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                                  .animate()
                                  .fadeIn()
                                  .slideX()
                                  .scaleXY(begin: 0.5)
                                  .then();
                            },
                          ),
                          20.addVerticalSpace,
                          const Text(
                            "Details",
                            style: supTitleBold,
                          ).animate().scaleXY(begin: 0.1, delay: 350.ms),
                          const Text(
                            "Pro-Sense brand offers a variety of proactive, sensible solutions for all of your pet’s healthcare and wellness needs. We know pet parenting can be tough, which is why we’ve improved our ingredients and benefits to make it easier than ever to care for them like any other member of your family. Your pet can experience allergies just ",
                            style: bodyMedium,
                          ).animate().scaleXY(begin: 0.1, delay: 350.ms),
                          100.addVerticalSpace,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer<ProductController>(
        builder: (context, instance, child) => ElevatedButton(
          onPressed: instance.isFloatingActionButtonEnabled() ? () {} : null,
          child: const Text("Add to cart"),
        ),
      ),
    );
  }
}
