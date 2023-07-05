part of shop_screens;

class CartScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
      name: 'Pro-Sense Itch & Allergy Solutions',
      price: 14.36,
      originalPrice: 15.36,
      quantity: 2,
      imagePath: ImageAssets.dogMedicine,
    ),
    Product(
      name: 'Naturel Promise Fresh Dental Water Additive18 fl oz',
      price: 12.00,
      originalPrice: 18.00,
      quantity: 1,
      imagePath: ImageAssets.dogMedicine,
    ),
    Product(
      name:
          'Jinx Chicken, Brown Rice & Sweet Potato Dry Dog Food, 23.5 lb. Bag',
      price: 20.00,
      originalPrice: 25.00,
      quantity: 3,
      imagePath: ImageAssets.dogMedicine,
    ),
    Product(
      name:
          'Jinx Chicken, Brown Rice & Sweet Potato Dry Dog Food, 23.5 lb. Bag',
      price: 20.00,
      originalPrice: 25.00,
      quantity: 3,
      imagePath: ImageAssets.dogMedicine,
    ),
    Product(
      name:
          'Jinx Chicken, Brown Rice & Sweet Potato Dry Dog Food, 23.5 lb. Bag',
      price: 20.00,
      originalPrice: 25.00,
      quantity: 3,
      imagePath: ImageAssets.dogMedicine,
    ),
    Product(
      name:
          'Jinx Chicken, Brown Rice & Sweet Potato Dry Dog Food, 23.5 lb. Bag',
      price: 20.00,
      originalPrice: 25.00,
      quantity: 3,
      imagePath: ImageAssets.dogMedicine,
    ),
    Product(
      name:
          'Jinx Chicken, Brown Rice & Sweet Potato Dry Dog Food, 23.5 lb. Bag',
      price: 20.00,
      originalPrice: 25.00,
      quantity: 3,
      imagePath: ImageAssets.dogMedicine,
    ),
    Product(
      name:
          'Jinx Chicken, Brown Rice & Sweet Potato Dry Dog Food, 23.5 lb. Bag',
      price: 20.00,
      originalPrice: 25.00,
      quantity: 3,
      imagePath: ImageAssets.dogMedicine,
    ),
    Product(
      name:
          'Jinx Chicken, Brown Rice & Sweet Potato Dry Dog Food, 23.5 lb. Bag',
      price: 20.00,
      originalPrice: 25.00,
      quantity: 3,
      imagePath: ImageAssets.dogMedicine,
    ),
  ];

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
        title: const Text('Your Cart'),
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
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.white,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: products.length + 1,
                itemBuilder: (context, index) {
                  return index != products.length
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  ImageAssets.dogMedicine,
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        products[index].name,
                                        style: footNoteRegular(
                                            color: ColorManager.primary),
                                      ),
                                      20.addVerticalSpace,
                                      Row(
                                        children: [
                                          Text(
                                            '\$${products[index].price.toStringAsFixed(2)}',
                                            style: bodyBoldPrimary,
                                          ),
                                          5.horizontalSpace,
                                          Text(
                                            '\$${(products[index].originalPrice - products[index].price).toStringAsFixed(2)}',
                                            style: captionRegularLine,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SvgPicture.asset(
                                      IconAssets.incrementButton,
                                    ),
                                    10.addVerticalSpace,
                                    Text('${products[index].quantity}'),
                                    10.addVerticalSpace,
                                    SvgPicture.asset(
                                      IconAssets.decrementButton,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            5.addVerticalSpace,
                            Divider(
                              color: ColorManager.primaryWithTransparent10,
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Divider(
                              color: ColorManager.primaryWithTransparent10,
                            ),
                            20.addVerticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Subtotal',
                                    style: footNoteRegular(
                                        color: ColorManager.primary)),
                                Text(
                                    '\$${calculateSubtotal().toStringAsFixed(2)}',
                                    style: bodyBoldPrimary),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.35,
                            )
                          ],
                        );
                },
              ),
            ),
            50.addVerticalSpace,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            backgroundColor: ColorManager.secondary,
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          ElevatedButton(
            child: const Text("Checkout"),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  double calculateSubtotal() {
    double subtotal = 0.0;
    for (var product in products) {
      subtotal += product.price * product.quantity;
    }
    return subtotal;
  }
}
