part of location_module;

class AddNewAddressManually extends StatefulWidget {
  const AddNewAddressManually({Key? key}) : super(key: key);

  @override
  State<AddNewAddressManually> createState() => _AddNewAddressManuallyState();
}

class _AddNewAddressManuallyState extends State<AddNewAddressManually> {
  final TextEditingController streetController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  final TextEditingController suiteController = TextEditingController();

  @override
  void initState() {
    sl<AddressProvider>().getAddressProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const ElevatedButton(
        onPressed: null,
        child: Text("Save"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: const Text("Add new Address"),
      ),
      body: Consumer<AddressProvider>(
        builder: (context, instance, child) => Padding(
          padding: AppPadding.p24.paddingHorizontal,
          child: Column(
            children: [
              AppSize.s20.addVerticalSpace,
              InkWell(
                onTap: () => showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16)),
                  ),
                  builder: (BuildContext context) =>
                      selectLocationType(instance),
                ),
                child: Container(
                  padding: AppPadding.p24.paddingHorizontal,
                  height: AppSize.s56.height,
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: AppSize.s16.circularRadius,
                      boxShadow: [customShadow()]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        instance.singleAddress == null
                            ? "Location Type"
                            : instance.singleAddress!.type!,
                        style: bodyRegular(
                            color: instance.singleAddress == null
                                ? ColorManager.secondGray
                                : ColorManager.primary),
                      ),
                      const Icon(
                        Icons.arrow_downward,
                        color: ColorManager.gray,
                      )
                    ],
                  ),
                ),
              ),
              AppSize.s20.addVerticalSpace,
              CustomTextFormField(
                  hintText: "Street Address",
                  controller: streetController,
                  validator: (value) {
                    return null;
                  }),
              AppSize.s20.addVerticalSpace,
              CustomTextFormField(
                  hintText: "Apt, Suite, Bldg #",
                  controller: suiteController,
                  validator: (value) {
                    return null;
                  }),
              AppSize.s20.addVerticalSpace,
              CustomTextFormField(
                  hintText: "Postcode",
                  controller: postCodeController,
                  validator: (value) {
                    return null;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
