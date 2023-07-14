part of home_ui_module;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// PR request
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    sl<HomeProvider>().getPetsProvider();
    sl<HomeProvider>().getVetsProvider();
    sl<ProductController>().getBestSellerProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Row(
          children: [
            Text(
              "Hello, ",
              style: titleRegular,
            ),
            Text(
              "Jaylon",
              style: titleBold,
            )
          ],
        ),
        actions: [
          CustomIconButton(
            onTap: () {},
            iconPath: IconAssets.search,
          ),
          AppSize.s35.addHorizontalSpace
        ],
      ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: 24.paddingHorizontal,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), //<-- SEE HERE
              ),
              color: ColorManager.tertiary,
              child: Row(children: [
                Expanded(
                  child: Padding(
                    padding: 24.paddingLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          AppStrings.smartPetCare,
                          style: titleSemiBoldPrimary,
                        ),
                        2.addVerticalSpace,
                        Text(
                          AppStrings.smartPetCareSub,
                          style: footNoteRegular(
                              color: ColorManager.primaryWithTransparent30),
                        ),
                        15.addVerticalSpace,
                        ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            AppStrings.appointmentNow,
                            style: footNoteRegular(color: ColorManager.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Image.asset(ImageAssets.dog2)
              ]),
            ),
          ),
          AppSize.s25.addVerticalSpace,
          Padding(
            padding: 24.paddingHorizontal,
            child: Text(
              "Select your pet",
              style:
                  footNoteRegular(color: ColorManager.primaryWithTransparent60),
            ),
          ),
          13.addVerticalSpace,
          SizedBox(
            height: 70.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Consumer<HomeProvider>(
                builder: (context, value, child) => value.petsModel == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: value.petsModel!.pets!.length + 1,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          final petIndex = index - 1;

                          return index == 0
                              ? Padding(
                                  padding: const EdgeInsets.only(right: 2),
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: SvgPicture.asset(
                                      IconAssets.incrementButton,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    value.selectPet(petIndex);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 2),
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: value.petsModel!
                                                  .pets![petIndex].selected!
                                              ? ColorManager.secondary
                                              : Colors.transparent,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
                                      child: CircleAvatar(
                                        radius: 30,
                                        backgroundImage: NetworkImage(value
                                            .petsModel!.pets![petIndex].image!),
                                      ),
                                    ),
                                  ),
                                );
                        },
                      ),
              ),
            ),
          ),

          const RVerticalSpace(height: AppSize.s32),
          DividerShopCard(
            title: AppStrings.petShop,
            textButton: AppStrings.seeAll,
            onPressed: () {},
          ),
          const RVerticalSpace(height: AppSize.s16),
          Consumer<ProductController>(
            builder: (context, productProvider, child) => SizedBox(
                height: 280.h,
                child: productProvider.products == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: productProvider.products!.products!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => GestureDetector(
                              onTap: () {
                                productProvider.setProductObject(
                                    current: productProvider
                                        .products!.products![index]);
                              },
                              child: ShodCard(
                                onTap: () {
                                  setState(() {
                                    productProvider.products!.products![index]
                                                .inCart !=
                                            true
                                        ? productProvider.deleteFromCart(
                                            productProvider
                                                .products!.products![index])
                                        : productProvider.addToCart(
                                            productProvider
                                                .products!.products![index]);
                                    productProvider
                                            .products!.products![index].inCart =
                                        !productProvider
                                            .products!.products![index].inCart!;
                                  });
                                },
                                singleProduct:
                                    productProvider.products!.products![index],
                              )
                                  .animate(delay: 200.ms)
                                  .moveX(begin: -100)
                                  .then()
                                  .shakeX(hz: 4, amount: 3),
                            ))),
          ),
          const RVerticalSpace(height: AppSize.s32),
          // Padding(
          DividerShopCard(
            title: AppStrings.vets,
            textButton: AppStrings.seeAll,
            onPressed: () {},
          ),
          const RVerticalSpace(height: AppSize.s16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: 180.height,
              child: Consumer<HomeProvider>(
                builder: (context, value, child) => value.petsModel == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: value.petsModel!.pets!.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
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
                                      value.vetsModel!.vets![index].image!,
                                      fit: BoxFit.cover,
                                      width: 150.width,
                                      height: 180.height,
                                    ),
                                  ),
                                  Positioned(
                                    left: 14,
                                    bottom: 11,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          value.vetsModel!.vets![index].name!,
                                          style: footNoteBold.copyWith(
                                              color: ColorManager.primary),
                                        ),
                                        4.addVerticalSpace,
                                        RatingStars(
                                          rating: value
                                              .vetsModel!.vets![index].review!
                                              .toDouble(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black.withOpacity(0.3),
                                            Colors.black.withOpacity(0.0),
                                          ],
                                        ),
                                      ),
                                      width: 150.width,
                                      height: 100.height,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
          const RVerticalSpace(height: AppSize.s56),
        ]),
      ),
    );
  }
}
