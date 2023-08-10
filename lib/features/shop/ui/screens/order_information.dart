part of shop_screens;

class OrderInformationScreen extends StatefulWidget {
  const OrderInformationScreen({super.key});

  @override
  State<OrderInformationScreen> createState() => _OrderInformationScreenState();
}

class _OrderInformationScreenState extends State<OrderInformationScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProvider>(context, listen: false).visaList =
          Provider.of<ProductProvider>(context, listen: false).parseJsonData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      appBar: AppBar(
        backgroundColor: const Color(0xffF8F8F8),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            RouteService.serviceNavi.pop();
            // Handle back button press
          },
        ),
        title: const Text('Order information'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.addVerticalSpace,
            Container(
              // margin: 10.marginVertical,
              height: MediaQuery.of(context).size.height,
              padding: 20.paddingAll,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery to",
                        style: bodyRegular(color: ColorManager.primary),
                      ),
                      TextButton(
                          onPressed: () {
                            RouteService.serviceNavi.pushNamedWidget(
                                RouteGenerator.addNewLocationManual);
                          },
                          child: Text(
                            "Change",
                            style: bodyRegular(color: ColorManager.secondary),
                          ))
                    ],
                  ),
                  Text(
                    "5616 Artesian Dr Derwood,Maryland(MD), 20855",
                    style: footNoteBold,
                  ),
                  10.addVerticalSpace,
                  const Divider(),
                  5.addVerticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Payment method",
                        style: bodyRegular(color: ColorManager.primary),
                      ),
                      TextButton.icon(
                        icon: const Icon(
                          Icons.add,
                          color: ColorManager.secondary,
                          size: 14,
                        ),
                        onPressed: () {
                          RouteService.serviceNavi
                              .pushNamedWidget(RouteGenerator.addNewCardScreen);
                        },
                        label: Text(
                          "Add",
                          style: bodyRegular(color: ColorManager.secondary),
                        ),
                      )
                    ],
                  ),

                  /// TODO: Payments Card Creating left
                  SizedBox(
                    height: Get.height * 0.25,
                    // width: Get.width * 0.70,
                    child: Consumer<ProductProvider>(
                      builder: (context, value, child) => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.visaList.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            value.selectVisa(index);
                          },
                          child: Card(
                            margin: 12.marginAll,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: value.selectedIndexPayment == index
                                    ? ColorManager.secondary
                                    : ColorManager.primaryWithTransparent10,
                                width:
                                    value.visaList[index].isSelected ? 1.0 : 3,
                              ),
                              borderRadius: BorderRadius.circular(16.0.r),
                            ),
                            color: ColorManager.primary,
                            child: Container(
                              padding: 24.paddingAll,
                              width: 204,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        IconAssets.mastercard,
                                        width: 39,
                                        height: 39,
                                      ),
                                      Text(
                                        " ${value.visaList[index].paymentMethod}",
                                        style: bodyMedium.copyWith(
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  // 32.addVerticalSpace,
                                  Row(
                                    children: [
                                      Text(
                                        "•••• ${value.visaList[index].visaLastFour}",
                                        style: bodyMedium.copyWith(
                                            color: Colors.white),
                                      ),
                                      const Spacer(),
                                      Visibility(
                                          visible: value.selectedIndexPayment ==
                                              index,
                                          child: const Icon(
                                            Icons.check_box_rounded,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Consumer<OrderInformationProvide>(
                    builder: (context, value, child) => GestureDetector(
                        onTap: () {
                          if (value.isShow == false &&
                              value.showPromotionResult == false) {
                            value.change(show: true);
                            // value.showPromotion(show: true);
                          } else if (value.isShow == false &&
                              value.showPromotionResult == true) {
                          } else {
                            value.change(show: false);
                            value.showPromotion(show: false);
                          }
                        },
                        child: Card(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: ColorManager.primaryWithTransparent10,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0.r),
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SvgPicture.asset(
                                  value.isShow == false
                                      ? IconAssets.plusButton
                                      : IconAssets.cancel,
                                  width: 40.width,
                                  height: 40.height,
                                ),
                              ),
                              Text(
                                value.isShow == false
                                    ? "Add Promotion Code"
                                    : "Delete Promotion Code",
                                style:
                                    bodyRegular(color: ColorManager.secondary),
                              ),
                            ],
                          ),
                        )),
                  ),
                  10.addVerticalSpace,
                  Consumer<OrderInformationProvide>(
                    builder: (context, value, child) => Visibility(
                        visible: value.isShow == true,
                        child: Visibility(
                          visible: value.showPromotionResult == false,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: CustomTextFormField(
                                    keyBoardType: TextInputType.number,
                                    hintText: "Add Code",
                                    onChange: (v) {
                                      value.promotionsCodeController.text = v;
                                    },
                                    validator: (value) {
                                      return null;
                                    }),
                              ),
                              10.addHorizontalSpace,
                              Expanded(
                                flex: 1,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (value.promotionsCodeController.text
                                        .isNotEmpty) {
                                      value.showPromotion(show: true);
                                    } else {
                                      value.showPromotion(show: false);
                                    }
                                  },
                                  child:
                                      const FittedBox(child: Text("Confirm")),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  20.addVerticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal',
                          style: footNoteRegular(color: ColorManager.primary)),
                      const Text('\$200', style: bodyBoldPrimary),
                    ],
                  ),
                  20.addVerticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery',
                          style: footNoteRegular(color: ColorManager.primary)),
                      const Text('Free', style: bodyBoldSecondary),
                    ],
                  ),
                  20.addVerticalSpace,
                  Consumer<OrderInformationProvide>(
                    builder: (context, value, child) => Visibility(
                      visible: value.showPromotionResult == true,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Promotion',
                              style:
                                  footNoteRegular(color: ColorManager.primary)),
                          Text("\$${value.promotionsCodeController.text}",
                              style: bodyBoldSecondary),
                        ],
                      ),
                    ),
                  ),
                  Consumer<OrderInformationProvide>(
                    builder: (context, value, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total',
                            style:
                                footNoteRegular(color: ColorManager.primary)),
                        Text(
                            '\$${200 - (int.parse(value.promotionsCodeController.text.isEmpty ? "0" : value.promotionsCodeController.text))}',
                            style: h3Bold),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: const Text("Place order"),
        onPressed: () {
          RouteService.serviceNavi.pushNamedWidget(RouteGenerator.orderSuccess);
        },
      ),
    );
  }
}
