part of profile_module;

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment methods"),
        leading: Row(
          children: [
            AppSize.s15.addHorizontalSpace,
            IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back)),
          ],
        ),
      ),
      body: Column(
        children: [
          AppSize.s32.addVerticalSpace,
          Expanded(
            child: Container(
              padding: AppPadding.p24.paddingHorizontal,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: AppSize.s30.circularRadius,
                boxShadow: [customShadow()]
              ),
              child: Column(
                children: [
                  Container(
                      padding: AppPadding.p24.paddingBottom,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Container(
                          padding: AppPadding.p8.paddingAll,
                          height: AppSize.s40.height,
                          width: AppSize.s40.width,
                          decoration: BoxDecoration(
                            color: ColorManager.secondaryWithTransparent50,
                            shape: BoxShape.rectangle,
                            borderRadius: AppSize.s10.circularRadius
                          ),
                          child: SvgPicture.asset(IconAssets.mastercard),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
