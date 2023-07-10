part of shop_screens;

class CartScreen extends StatelessWidget {
  CartScreen({this.singleProduct});
  final SingleProduct? singleProduct;

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
        title: const Text('Your Cart'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            20.addVerticalSpace,
            Container(
              // margin: 10.marginVertical,
              height: Get.height,
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
              child: Consumer<ProductController>(
                builder: (context, value, child) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: value.cartList.length + 1,
                  itemBuilder: (context, index) {
                    return index != value.cartList.length
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    value.cartList[index].coverImage!,
                                    width: Get.width * 0.25,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.4,
                                          child: Text(
                                            value.cartList[index].name!,
                                            style: footNoteRegular(
                                                color: ColorManager.primary),
                                            maxLines: 3,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        20.addVerticalSpace,
                                        Row(
                                          children: [
                                            Text(
                                              '\$${value.cartList[index].price?.toStringAsFixed(2)}',
                                              style: bodyBoldPrimary,
                                            ),
                                            5.horizontalSpace,
                                            Text(
                                              '\$${(value.cartList[index].originalPrice! - value.cartList[index].price!).toStringAsFixed(2)}',
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
                                      Text(
                                          '${value.cartList[index].cartQuantity!}'),
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
                              20.addVerticalSpace,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Subtotal',
                                      style: footNoteRegular(
                                          color: ColorManager.primary)),
                                  Text(
                                      '\$${calculateSubtotal(value.cartList).toStringAsFixed(2)}',
                                      style: bodyBoldPrimary),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.35,
                              )
                            ],
                          );
                  },
                ),
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

  double calculateSubtotal(cartList) {
    double subtotal = 0.0;
    for (var product in cartList) {
      subtotal += product.price * product.cartQuantity;
    }
    return subtotal;
  }
}
