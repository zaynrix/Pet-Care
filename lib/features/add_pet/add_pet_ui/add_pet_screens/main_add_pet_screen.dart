part of add_shop_screens;

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
    Provider.of<AddPetProvider>(context, listen: false).initStateAddPet();
  }

  final SizeConfig sizeConfig = locator<SizeConfig>();

  final PageController controllerPages = PageController();

  TextEditingController petNameController = TextEditingController();

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
    return Consumer<AddPetProvider>(
      builder: (context, provider, child) => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          margin: provider.currantPage <= 1 || provider.currantPage == 6
              ? const EdgeInsets.only(bottom: AppPadding.p24)
              : const EdgeInsets.only(bottom: AppSize.s60),
          child: ElevatedButton(
              onPressed: () {
                provider.pageController!.nextPage(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.linear);
                if (provider.currantPage >= 0 &&
                    provider.currantPage < pages.length) {
                  final currentPageWidget = pages[provider.currantPage];
                  if (currentPageWidget is PageWidget) {
                    currentPageWidget.onPressedFunction();
                  }
                }
              },
              child: const Text("Next")),
        ),
        body: SafeArea(
          child: Column(
            children: [
              addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s9)),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: sizeConfig.getScreenWidth(AppSize.s24)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          // focusColor: ColorManager.secondGray,
                          onTap: () {
                            provider.currantPage == 0
                                ? RouteService.serviceNavi.popFunction()
                                : provider.pageController!.previousPage(
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
                          "${provider.currantPage + 1}/7",
                          style: supTitleRegular,
                        )
                      ],
                    ),
                    addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s24)),
                    const LinearProgressStatusBar(),
                  ],
                ),
              ),
              addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s32)),
              SizedBox(
                width: double.infinity,
                height: provider.currantPage < 6
                    ? MediaQuery.of(context).size.height * 0.48
                    : MediaQuery.of(context).size.height * 0.7,
                // alignment: Alignment.center,
                child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    onPageChanged: (value) => provider.onPageChange(value),
                    itemCount: pages.length,
                    controller: provider.pageController,
                    itemBuilder: (context, index) {
                      return AnimatedBuilder(
                        animation: provider.pageController!,
                        builder: (context, child) {
                          double value = 1.0;
                          if (provider
                              .pageController!.position.haveDimensions) {
                            value = provider.pageController!.page! - index;
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
                visible: provider.currantPage > 1 && provider.currantPage < 6,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "I don’t know",
                    style: bodyRegular(color: ColorManager.secondary),
                  ),
                ),
              ),
              addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s20)),
            ],
          ),
        ),
      ),
    );
  }
}
