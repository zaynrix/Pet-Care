part of shop_screens;

class MainShopScreen extends StatefulWidget {
  const MainShopScreen({Key? key}) : super(key: key);

  @override
  State<MainShopScreen> createState() => _MainShopScreenState();
}

class _MainShopScreenState extends State<MainShopScreen> {
  final SizeConfig sizeConfig = sl<SizeConfig>();

  final productProvider = sl<ProductController>();

  @override
  void initState() {
    super.initState();
    productProvider.getPetShopProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder: (context, value, child) => DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: ColorManager.soft,
          appBar: AppBar(
            title: const Text("Pet Shop"),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
            actions: [
              InkWell(
                onTap: () {
                  RouteService.serviceNavi
                      .pushNamedWidget(RouteGenerator.cartScreen);
                },
                child: Center(
                  child: Badge(
                    isLabelVisible: true,
                    backgroundColor: ColorManager.secondary,
                    alignment: AlignmentDirectional.bottomEnd,
                    textStyle: captionBold.copyWith(color: ColorManager.white),
                    textColor: ColorManager.white,
                    label: Text(
                      "${value.cartList.length}",
                      style: captionBold.copyWith(color: ColorManager.white),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(AppSize.s10),
                      height: sizeConfig.getScreenHeight(AppSize.s55),
                      width: sizeConfig.getScreenWidth(AppSize.s55),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: ColorManager.primaryWithTransparent30,
                              width: 1)),
                      child: SvgPicture.asset(
                        IconAssets.unSelectedCart,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const RHorizontalSpace(width: AppSize.s20),
            ],
            bottom: PreferredSize(
              preferredSize:
                  Size.fromHeight(sizeConfig.getScreenHeight(AppSize.s40)),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: ColorManager.primaryWithTransparent10,
                            width: 1))),
                child: TabBar(
                    onTap: (index) {},
                    unselectedLabelColor: ColorManager.primary,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: ColorManager.secondary, width: 2),
                        ),
                        color: ColorManager.transparent),
                    tabs: [
                      Tab(
                        child: Text(
                          "Pharmacy ",
                          maxLines: 1,
                          style: bodyRegular(color: ColorManager.gray),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Pet food",
                          maxLines: 1,
                          style: bodyRegular(color: ColorManager.gray),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Accessorise",
                          maxLines: 1,
                          style: bodyRegular(color: ColorManager.gray),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Furniture",
                          maxLines: 1,
                          style: bodyRegular(color: ColorManager.gray),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              const PharmacyShopScreen(),
              SignUpScreen(),
              SignUpScreen(),
              LoginScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
