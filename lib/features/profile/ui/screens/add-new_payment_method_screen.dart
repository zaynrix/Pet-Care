part of profile_module;

class AddNewPaymentMethodScreen extends StatelessWidget {
  AddNewPaymentMethodScreen({Key? key}) : super(key: key);

  static List<String> paymentMethods = ["Credit Card" , "Paypal" , "Google Pay", "Apple Pay"];
  String currentMethod = paymentMethods[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new method"),
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
                children:  [
                  ChoosePaymentMethodCard(currentMethod: currentMethod, iconPath: IconAssets.mastercard,
                    methodType: 'Credit Card',
                    value: paymentMethods[0],
                    onChange: (value){},
                  ),
                  AppSize.s20.addVerticalSpace,
                  ChoosePaymentMethodCard(currentMethod: currentMethod, iconPath: IconAssets.paypal,
                    methodType: 'PayPal',
                    value: paymentMethods[1],
                    onChange: (value){},
                  ),
                  AppSize.s20.addVerticalSpace,
                  ChoosePaymentMethodCard(currentMethod: currentMethod, iconPath: IconAssets.googleIcon,
                    methodType: 'PayPal',
                    value: paymentMethods[2],
                    onChange: (value){},
                  ),
                  AppSize.s20.addVerticalSpace,
                  ChoosePaymentMethodCard(currentMethod: currentMethod, iconPath: IconAssets.appleIcon,
                    methodType: 'PayPal',
                    value: paymentMethods[3],
                    onChange: (value){},
                  ),
                  const Spacer(),
                  ElevatedButton(onPressed: (){}, child: const Text("Next")),
                  AppSize.s16.addVerticalSpace
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


