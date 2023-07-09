part of location_module;

class AddNewAddressManually extends StatelessWidget {
   AddNewAddressManually({Key? key}) : super(key: key);
  final TextEditingController streetController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  final TextEditingController suiteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(onPressed: null, child: Text("Save"), ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text("Add new Address"),
      ),
      body: Padding(
        padding: AppPadding.p24.paddingHorizontal,
        child: Column(
          children: [
            AppSize.s20.addVerticalSpace,
            InkWell(
              onTap: () => showModalBottomSheet(context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                builder: (BuildContext context) => const SelectLocationType(),
              ),
              child: Container(
                padding: AppPadding.p24.paddingHorizontal,
                height: AppSize.s56.height,
                decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: AppSize.s16.circularRadius,
                  boxShadow: [customShadow()]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Location Type", style: bodyRegular(color: ColorManager.secondGray),),
                    Icon(Icons.arrow_downward , color: ColorManager.gray,)
                  ],
                ),
              ),
            ),
            AppSize.s20.addVerticalSpace,
            CustomTextFormField(hintText: "Street Address", controller: streetController, validator: (value){}),
            AppSize.s20.addVerticalSpace,
            CustomTextFormField(hintText: "Apt, Suite, Bldg #", controller: suiteController, validator: (value){}),
            AppSize.s20.addVerticalSpace,
            CustomTextFormField(hintText: "Postcode", controller: postCodeController, validator: (value){}),
          ],
        ),
      ),
    );
  }
}
