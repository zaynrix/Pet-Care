part of shop_screens;

class AddNewCard extends StatelessWidget {
  const AddNewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        centerTitle: true,
        title: const Text("Add New Card"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: const Text("Save"),
        onPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: 22.marginAll,
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: ColorManager.primaryWithTransparent10,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(16.0.r),
              ),
              color: ColorManager.primary,
              child: Container(
                padding: 24.paddingAll,
                width: double.infinity,
                // height: MediaQuery.of(context).size.height * 0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      IconAssets.mastercard,
                      width: 64,
                      height: 64,
                    ),
                    31.addVerticalSpace,
                    Text(
                      "HOLDER NAME",
                      style: h3Medium2,
                    ),
                    const Text(
                      "0000 0000 0000 0000",
                      style: h3Medium2,
                    ),
                  ],
                ),
              ),
            ),
            32.addVerticalSpace,
            Padding(
              padding: 25.paddingHorizontal,
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: "Card Label",
                    validator: (String? value) => value!.validateUserName(),
                    keyBoardType: TextInputType.name,
                    controller: TextEditingController(),
                    // controller: petNameController,
                  ),
                  20.addVerticalSpace,
                  CustomTextFormField(
                    keyBoardType: TextInputType.text,
                    hintText: "Card holder name",
                    validator: (String? value) => value!.validateUserName(),
                    controller: TextEditingController(),
                    inputFormatters: [
                      FilteringTextInputFormatter.singleLineFormatter,
                      LengthLimitingTextInputFormatter(22),
                      // CardNumberInputFormatter(),
                    ],
                    // controller: petNameController,
                  ),
                  20.addVerticalSpace,
                  CustomTextFormField(
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(16),
                      // CardNumberInputFormatter(),
                    ],
                    hintText: "Card number",
                    validator: (String? value) => value!.validateIdNumber(),
                    keyBoardType: TextInputType.number,
                    controller: TextEditingController(),
                    // controller: petNameController,
                  ),
                  20.addVerticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          // keyboardType: TextInputType.datetime,
                          validator: (String? value) =>
                              value!.validateIdNumber(),

                          hintText: 'MM/YY',
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            // CardMonthInputFormatter(),
                          ],
                          controller: TextEditingController(),
                          // focuse: (_) => FocusScope.of(context).nextFocus(),
                          // textInputAction: TextInputAction.next,
                          // onChanged: (val) {
                          //   value.mmyyController.text = val!;
                          // },
                          // validator: (value) =>
                          //     CardUtils.validateDate(value ?? ""),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          validator: (String? value) =>
                              value!.validateUserName(),
                          keyBoardType: TextInputType.number,
                          hintText: 'CVV',
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            // Limit the input
                            LengthLimitingTextInputFormatter(4),
                          ],
                          controller: TextEditingController(),
                          // validator: (value) =>
                          //     CardUtils.validateCVV(value ?? ""),
                        ),
                      ),
                    ],
                  ),
                  120.addVerticalSpace,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
