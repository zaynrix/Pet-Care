part of shop_screens;

class MainShopScreen extends StatelessWidget {
  MainShopScreen({Key? key}) : super(key: key);

  final SizeConfig sizeConfig = sl<SizeConfig>();


  @override
  Widget build(BuildContext context) {
    return

      DefaultTabController(
        length: 4,
        child: Scaffold(
        backgroundColor: ColorManager.soft,
        appBar: AppBar(
          title: const Text("Pet Shop"),
          leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back),),
          actions: [
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(AppSize.s10),
                height: sizeConfig.getScreenHeight(AppSize.s44),
                width: sizeConfig.getScreenWidth(AppSize.s44),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorManager.primaryWithTransparent30  , width: 1)
                ),
                child: SvgPicture.asset(IconAssets.unSelectedCart),
              ),
            ),
            const RHorizontalSpace(width: AppSize.s20),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(sizeConfig.getScreenHeight(AppSize.s40)),
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ColorManager.primaryWithTransparent10,
                    width: 1
                  )
                )
              ),
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
                        child: Text("Pet food",
                            maxLines: 1,
                          style: bodyRegular(color: ColorManager.gray),
                            ),
                      ),
                      Tab(
                        child: Text("Accessorise",
                            maxLines: 1,
                          style: bodyRegular(color: ColorManager.gray),
                            ),
                      ),
                      Tab(
                        child: Text("Furniture",
                            maxLines: 1,
                          style: bodyRegular(color: ColorManager.gray),
                            ),
                      ),
                    ]),
            ),
          ),
          ),
        body: TabBarView(

          // physics: const NeverScrollableScrollPhysics(),
          children: [
            const PharmacyShopScreen(),
            SignUpScreen(),
            SignUpScreen(),
            LoginScreen(),
          ],
        ),
        ),
      );

  }
}
