part of add_pet_module;

class MainAppPetScreen extends StatefulWidget {
   MainAppPetScreen({Key? key}) : super(key: key);

  @override
  State<MainAppPetScreen> createState() => _MainAppPetScreenState();
}

class _MainAppPetScreenState extends State<MainAppPetScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addPetController.onInit();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    addPetController.pageController!.dispose();
  }
   final AddPetController addPetController = Get.put(AddPetController(), permanent: true);

  final List<Widget> pages = [
    AddPetNameScreen(),
    AddPetSpeciesScreen(),
    AddPetBreedScreen(),
    AddPetGenderScreen(),
    IsPetNeuterScreen(),
    AppOldPetScreen(),
    AddPhotoForPetScreen()
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint("This is inside main add pet page");
    return GetBuilder<AddPetController>(
      builder: (GetxController controller) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          margin: AddPetController.currantPage <= 1 || AddPetController.currantPage == 6
              ? const EdgeInsets.only(bottom: AppPadding.p24)
              : const EdgeInsets.only(bottom: AppSize.s60),
          child: ElevatedButton(
              onPressed: () {
                if (AddPetController.currantPage >= 0 &&
                    AddPetController.currantPage < pages.length) {
                  final currentPageWidget = pages[AddPetController.currantPage];
                  if (currentPageWidget is PageWidget) {
                    currentPageWidget.onPressedFunction();
                  }
                }
              },
              child: const Text(AppStrings.next)),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const RVerticalSpace(height: AppSize.s9),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sizeConfig.getScreenWidth(AppSize.s24)),
                child: Column(
                  children: [
                    AppSize.s10.addVerticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          // focusColor: ColorManager.secondGray,
                          onTap: () {
                            AddPetController.currantPage == 0
                                ? RouteService.serviceNavi.pop()
                                : addPetController.pageController!.previousPage(
                                    duration: const Duration(milliseconds: 350),
                                    curve: Curves.easeInOut);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 32,
                            color: ColorManager.primary,
                          ),
                        ),
                        Text(
                          "${AddPetController.currantPage + 1}/7",
                          style: supTitleRegular,
                        )
                      ],
                    ),
                    const RVerticalSpace(height: AppSize.s24),
                    const LinearProgressStatusBar(),
                  ],
                ),
              ),
              const RVerticalSpace(height: AppSize.s32),
              SizedBox(
                width: double.infinity,
                height: AddPetController.currantPage < 6
                    ? Get.height * 0.48
                    : Get.height * 0.7,
                // alignment: Alignment.center,
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (value) => addPetController.onPageChange(value),
                    itemCount: pages.length,
                    controller: addPetController.pageController,
                    itemBuilder: (context, index) {
                      return AnimatedBuilder(
                        animation: addPetController.pageController!,
                        builder: (context, child) {
                          double value = 1.0;
                          if (addPetController
                              .pageController!.position.haveDimensions) {
                            value = addPetController.pageController!.page! - index;
                            value = (1 - (value.abs() * 0.5)).clamp(0.0, 1.0);
                          }
                          return Transform.scale(
                            scale: Curves.easeInOut.transform(value),
                            child: child,
                          );
                        },
                        child: pages[index],
                      );
                      // pages[provider.activeIndex];
                    }),
              ),
              const Spacer(),
              Visibility(
                visible: AddPetController.currantPage > 1 && AddPetController.currantPage < 6,
                child: TextButton(
                  onPressed: () {
                    addPetController.goNextScreen();
                  },
                  child: Text(
                    "I don’t know",
                    style: bodyRegular(color: ColorManager.secondary),
                  ),
                ),
              ),
              const RVerticalSpace(height: AppSize.s20),
            ],
          ),
        ),
      ),
    );
  }
}
