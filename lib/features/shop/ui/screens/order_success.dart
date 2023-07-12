part of shop_screens;

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key}) : super(key: key);
//PR
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: const Text("Keep browsing"),
        onPressed: () {
          RouteService.serviceNavi
              .pushNamedWidget(RouteGenerator.mainShopScreen);
        },
      ),
      body: Column(
        children: [
          174.addVerticalSpace,
          Padding(
            padding: 64.paddingHorizontal,
            child: Lottie.asset(AnimationsAssets.success,
                width: 243, height: 200, fit: BoxFit.fitWidth),
          ),
          34.addVerticalSpace,
          const Text(
            AppStrings.orderPlacedSuccessfully,
            style: h3Bold,
          ),
          10.addVerticalSpace,
          Padding(
            padding: 30.paddingHorizontal,
            child: const Text(
              AppStrings.orderPlacedSuccessfullySub,
              style: supTitleMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
