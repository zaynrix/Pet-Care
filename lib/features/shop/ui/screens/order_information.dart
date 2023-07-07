part of shop_screens;

class OrderInformationScreen extends StatelessWidget {
  OrderInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      appBar: AppBar(
        backgroundColor: const Color(0xffF8F8F8),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
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
                          onPressed: () {},
                          child: Text(
                            "Change",
                            style: bodyRegular(color: ColorManager.secondary),
                          ))
                    ],
                  ),
                  const Text(
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
                        onPressed: () {},
                        label: Text(
                          "Add",
                          style: bodyRegular(color: ColorManager.secondary),
                        ),
                      )
                    ],
                  ),

                  /// TODO: Payments Card Creating left
                  Card(
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
                            IconAssets.plusButton,
                            width: 40.width,
                            height: 40.height,
                          ),
                        ),
                        Text(
                          "Add Promotion Code",
                          style: bodyRegular(color: ColorManager.secondary),
                        ),
                      ],
                    ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          style: footNoteRegular(color: ColorManager.primary)),
                      const Text('\$200', style: h3Bold),
                    ],
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
        onPressed: () {},
      ),
    );
  }
}
