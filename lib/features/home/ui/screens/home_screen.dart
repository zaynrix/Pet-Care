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

  final reminderController = Get.put(ReminderController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soft,
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
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                                style:
                                    footNoteRegular(color: ColorManager.white),
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
                  style: footNoteRegular(
                      color: ColorManager.primaryWithTransparent60),
                ),
              ),
              13.addVerticalSpace,
              SizedBox(
                height: 70.height,
                child: Padding(
                  padding: 24.paddingHorizontal,
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
                                        padding:
                                            const EdgeInsets.only(right: 2),
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
                                                .petsModel!
                                                .pets![petIndex]
                                                .image!),
                                          ),
                                        ),
                                      ),
                                    );
                            },
                          ),
                  ),
                ),
              ),

              AppSize.s32.addVerticalSpace,
              DividerShopCard(
                title: AppStrings.petShop,
                textButton: AppStrings.seeAll,
                onPressed: () {},
              ),
              AppSize.s16.addVerticalSpace,

              Consumer<ProductController>(
                builder: (context, productProvider, child) => SizedBox(
                    height: 280.h,
                    child: productProvider.products == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount:
                                productProvider.products!.products!.length,
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
                                        productProvider.products!
                                                    .products![index].inCart !=
                                                true
                                            ? productProvider.deleteFromCart(
                                                productProvider
                                                    .products!.products![index])
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
                                  )
                                      .animate(delay: 200.ms)
                                      .moveX(begin: -100)
                                      .then()
                                      .shakeX(hz: 4, amount: 3),
                                ))),
              ),
              AppSize.s32.addVerticalSpace,

              // Padding(
              DividerShopCard(
                title: AppStrings.vets,
                textButton: AppStrings.seeAll,
                onPressed: () {},
              ),
              AppSize.s16.addVerticalSpace,
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
                                          borderRadius:
                                              BorderRadius.circular(15.0),
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
                                              value.vetsModel!.vets![index]
                                                  .name!,
                                              style: footNoteBold.copyWith(
                                                  color: ColorManager.primary),
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
                                      PositionsCardShadow()
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ),
              ),
              AppSize.s56.addVerticalSpace,
              DividerShopCard(
                title: AppStrings.reminders,
                textButton: AppStrings.seeAll,
                onPressed: () {},
              ),
              const RVerticalSpace(height: AppSize.s12),
              GetBuilder<ReminderController>(
                builder: (controller) => reminderController.reminderBox == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : SizedBox(
                        height: 180.h,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                reminderController.reminderBox!.length + 1,
                            itemBuilder: (context, index) {
                              final reminderIndex = index - 1;
                              if (index == 0) {
                                return const AddReminderWidget();
                              } else {
                                final reminderValue = reminderController
                                    .reminderBox!
                                    .getAt(reminderIndex);
                                return Padding(
                                  padding: 12.paddingHorizontal,
                                  child: ReminderCardSub(
                                    deleteReminder: (context) {
                                      reminderController
                                          .deleteReminder(reminderIndex);
                                    },
                                    iconPath: reminderValue!.isDone == false
                                        ? IconAssets.notificationSelected
                                        : IconAssets.unSelectedNotification,
                                    date: reminderValue.createdAtDate
                                        .toString()
                                        .convertToFullDate()!,
                                    title: reminderValue.title,
                                    createdAt: reminderValue.createdAtTime
                                        .toString()
                                        .convertToTime24()!,
                                    description: reminderValue.description,
                                  ),
                                );
                              }
                            }),
                      ),
              ),
              AppSize.s32.addVerticalSpace,
            ]),
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
        width: 150.width,
        height: 100.height,
      ),
    );
  }
}

class AddReminderWidget extends StatelessWidget {
  const AddReminderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        RouteService.serviceNavi
            .pushNamedWidget(RouteGenerator.addReminderScreen);
      },
      child: Padding(
        padding: 24.paddingLeft,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 180.h,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Padding(
                padding: EdgeInsets.only(right: 2),
                child: Icon(
                  Icons.add,
                  size: 24,
                )),
          ),
        ),
      ),
    );
  }
}
