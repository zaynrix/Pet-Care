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
              padding: AppPadding.p24.paddingAll,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: AppSize.s30.circularRadius,
                boxShadow: [customShadow()]
              ),
              child: Column(
                children: const [
                  PaymentCard(iconPath: IconAssets.mastercard, supTitle: "**** 1994", title: "Ace Mastercard",),
                  PaymentCard(iconPath: IconAssets.visa, supTitle: "**** 1994", title: "My Visa Card",),
                  PaymentCard(iconPath: IconAssets.paypal, supTitle: "acevent@mail.com", title: "My lovely Paypal",),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

