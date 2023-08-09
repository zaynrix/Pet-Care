part of home_ui_module;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// PR request
class _HomeScreenState extends State<HomeScreen> {
  var dataaa = sl<HomeProvider>();

  @override
  void initState() {
    super.initState();
    print(" Befor sl HomeProvider/HomeScreen ${dataaa.hashCode}");

    sl<HomeProvider>().getPetsProvider();
    sl<HomeProvider>().getVetsProvider();
    sl<ProductProvider>().getPetShopProvider();
    print("After  sl HomeProvider/HomeScreen ${dataaa.hashCode}");
  }

  final reminderController = Get.put(ReminderController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soft,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            onTap: () {
              RouteService.serviceNavi
                  .pushNamedWidget(RouteGenerator.searchScreen);
            },
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
                                      child: GestureDetector(
                                        onTap: () {
                                          RouteService.serviceNavi
                                              .pushNamedWidget(RouteGenerator
                                                  .mainAddPetScreen);
                                        },
                                        child: CircleAvatar(
                                          radius: 30,
                                          child: SvgPicture.asset(
                                            IconAssets.incrementButton,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SelectionPetCard(
                                      petIndex: petIndex,
                                      onTap: () {
                                        value.selectPet(petIndex);
                                      },
                                      imagePath: value
                                          .petsModel!.pets![petIndex].image!,
                                      isSelected: value
                                          .petsModel!.pets![petIndex].selected!,
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
                onPressed: () {
                  RouteService.serviceNavi
                      .pushNamedWidget(RouteGenerator.allPetShopScreen);
                },
              ),
              AppSize.s16.addVerticalSpace,

              Consumer<ProductProvider>(
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
                onPressed: () {
                  RouteService.serviceNavi
                      .pushNamedWidget(RouteGenerator.allVetsDoctorScreen);

                  // AllPetProducts
                },
              ),
              AppSize.s16.addVerticalSpace,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  height: 220.height,
                  child: Consumer<HomeProvider>(
                    builder: (context, value, child) => value.vetsModel == null
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: value.vetsModel!.vets!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return VetCard(
                                vet: value.vetsModel!.vets![index],
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
