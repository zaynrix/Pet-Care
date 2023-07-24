part of shop_screens;

/// TODO: missing: Controllers & Validations & Focus Node Text field & Navigation's
class AddNewCard extends StatefulWidget {
  const AddNewCard({Key? key}) : super(key: key);

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
  CardProvider? _cardProvider;

  @override
  void initState() {
    _cardProvider = Provider.of<CardProvider>(context, listen: false);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _cardProvider = Provider.of<CardProvider>(context, listen: false);
    _cardProvider!.initController();
    _cardProvider!.cardListener();
  }

  @override
  void dispose() {
    _cardProvider!.disposeController();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        title: const Text(AppStrings.addNewCard),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: const Text(AppStrings.save),
        onPressed: () {
          RouteService.serviceNavi.pop();
        },
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).focusedChild!.unfocus();
        },
        child: ListView(
          children: [
            Column(
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
                  child: Consumer<CardProvider>(
                    builder: (context, instance, child) => Container(
                      padding: 24.paddingAll,
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            IconAssets.mastercard,
                            width: 64,
                            height: 64,
                          ),
                          15.addVerticalSpace,
                          Text(
                            instance.holderNameController.text.isEmpty
                                ? "Holder Name"
                                : instance.holderName,
                            style: instance.holderNameController.text.isEmpty
                                ? h3Medium2
                                : h3Medium2.copyWith(color: ColorManager.white),
                          ),
                          Text(
                            instance.numberController.text.isEmpty
                                ? "0000 0000 0000 0000"
                                : instance.visaNumber,
                            style: instance.numberController.text.isEmpty
                                ? h3Medium2
                                : h3Medium2.copyWith(color: ColorManager.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                10.addVerticalSpace,
                Padding(
                  padding: 25.paddingHorizontal,
                  child: Column(
                    children: [
                      CustomTextFormField(
                        hintText: "Card Label",
                        validator: (String? value) => value!.validateUserName(),
                        keyBoardType: TextInputType.name,
                        controller: _cardProvider!.labelController,
                        // controller: petNameController,
                      ),
                      10.addVerticalSpace,
                      CustomTextFormField(
                        keyBoardType: TextInputType.text,
                        hintText: "Card holder name",
                        validator: (String? value) => value!.validateUserName(),
                        controller: _cardProvider!.holderNameController,
                        inputFormatters: [
                          FilteringTextInputFormatter.singleLineFormatter,
                          LengthLimitingTextInputFormatter(22),
                          // CardNumberInputFormatter(),
                        ],
                      ),
                      10.addVerticalSpace,
                      CustomTextFormField(
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                          // CardNumberInputFormatter(),
                        ],
                        hintText: "Card number",
                        validator: (String? value) => value!.validateIdNumber(),
                        keyBoardType: TextInputType.number,
                        controller: _cardProvider!.numberController,
                      ),
                      10.addVerticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              validator: (String? value) =>
                                  value!.validateIdNumber(),
                              hintText: 'MM/YY',
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                                // CardMonthInputFormatter(),
                              ],
                              controller: _cardProvider!.mmYy,
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
                              controller: _cardProvider!.cVV,
                            ),
                          ),
                        ],
                      ),
                      60.addVerticalSpace,
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
