part of home_ui_module;

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

// PR request
class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController emailController = TextEditingController();

  final reminderController = Get.put(ReminderController(), permanent: true);

  @override
  void initState() {
    super.initState();
    sl<HomeProvider>().getVetsProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, instance, child) => Scaffold(
        backgroundColor: ColorManager.soft,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            AppStrings.search,
            style: titleBold,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Padding(
              padding: 24.paddingHorizontal,
              child: CustomTextFormField(
                  onChange: (value) {
                    instance.replaceIt();
                  },
                  suffixIcon: Icons.search,
                  hintText: AppStrings.typeProblems,
                  controller: emailController,
                  validator: (value) => value!.validateEmail(),
                  keyBoardType: TextInputType.emailAddress),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: instance.replace == false
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      32.addVerticalSpace,
                      Padding(
                        padding: 24.paddingLeft,
                        child: const Text(
                          AppStrings.discover,
                          style: titleSemiBoldPrimary,
                        ),
                      ),
                      13.addVerticalSpace,
                      Padding(
                        padding: 24.paddingLeft,
                        child: const Divider(),
                      ),
                      Padding(
                        padding: 24.paddingLeft,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: 4,
                          separatorBuilder: (context, index) => const Divider(),
                          itemBuilder: (context, index) {
                            return Text(
                              "One",
                              style: bodyRegular(color: ColorManager.primary),
                            );
                          },
                        ),
                      ),
                      AppSize.s32.addVerticalSpace,
                      DividerShopCard(
                        title: AppStrings.article,
                        textButton: AppStrings.seeAll,
                        textButtonColor: ColorManager.secondary,
                        onPressed: () {},
                      ),
                      // 16.addVerticalSpace,
                      Padding(
                        padding: 24.paddingLeft,
                        child: Consumer<ProductController>(
                          builder: (context, productProvider, child) =>
                              SizedBox(
                            height: 180,
                            child: productProvider.products == null
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    itemCount: productProvider
                                        .products!.products!.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        productProvider.setProductObject(
                                            current: productProvider
                                                .products!.products![index]);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Card(
                                            margin: 14.marginRight,
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.0), //<-- SEE HERE
                                            ),
                                            child: Image.network(
                                              "https://www.oekotest.de/static_files/images/article/Welches-Haustier-passt-zu-mir_Dora-Zett-Shutterstock_11586_lead.jpg",
                                              height: 129,
                                              width: 248.width,
                                            ),
                                          ),
                                          10.addVerticalSpace,
                                          Text(
                                            "Cat GroComing Tips",
                                            style: bodyRegular(
                                                color: ColorManager.primary),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      AppSize.s32.addVerticalSpace,
                      DividerShopCard(
                        title: AppStrings.topVet,
                        textButton: AppStrings.seeAll,
                        textButtonColor: ColorManager.secondary,
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SizedBox(
                          height: 180.height,
                          child: Consumer<HomeProvider>(
                            builder: (context, value, child) => value
                                        .petsModel ==
                                    null
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    itemCount: value.petsModel!.pets!.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: 16.paddingRight,
                                        child: Container(
                                          width: 150.width,
                                          height: 180.height,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                ),
                                                child: Image.network(
                                                  value.vetsModel!.vets![index]
                                                      .image!,
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
                                                      value.vetsModel!
                                                          .vets![index].name!,
                                                      style:
                                                          footNoteBold.copyWith(
                                                              color:
                                                                  ColorManager
                                                                      .primary),
                                                    ),
                                                    4.addVerticalSpace,
                                                    RatingStars(
                                                      rating: value.vetsModel!
                                                          .vets![index].review!
                                                          .toDouble(),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const PositionsCardShadow()
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                        ),
                      ),
                      AppSize.s32.addVerticalSpace,
                    ])
              : Consumer<ProductController>(
                  builder: (context, productProvider, child) => productProvider
                              .products ==
                          null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Padding(
                          padding: 20.paddingVertical,
                          child: GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount:
                                    2, // Number of columns in the grid
                                crossAxisSpacing:
                                    0.0, // Spacing between columns
                                mainAxisSpacing: 8.0, // Spacing between rows
                              ),
                              itemCount:
                                  productProvider.products!.products!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => GestureDetector(
                                    onTap: () {
                                      productProvider.setProductObject(
                                          current: productProvider
                                              .products!.products![index]);
                                    },
                                    child: ShodCardGrid(
                                      onTap: () {
                                        setState(() {
                                          productProvider
                                                      .products!
                                                      .products![index]
                                                      .inCart !=
                                                  true
                                              ? productProvider.deleteFromCart(
                                                  productProvider.products!
                                                      .products![index])
                                              : productProvider.addToCart(
                                                  productProvider.products!
                                                      .products![index]);
                                          productProvider.products!
                                                  .products![index].inCart =
                                              !productProvider.products!
                                                  .products![index].inCart!;
                                        });
                                      },
                                      singleProduct: productProvider
                                          .products!.products![index],
                                    ),
                                  )),
                        ),
                ),
        ),
      ),
    );
  }
}
