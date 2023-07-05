part of shop_screens;

class Product {
  final String name;
  final double price;
  final double originalPrice;
  final int quantity;
  final String imagePath;

  Product({
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.quantity,
    required this.imagePath,
  });
}

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
      name: 'Product 2',
      price: 15.00,
      originalPrice: 18.00,
      quantity: 1,
      imagePath: ImageAssets.dogMedicine,
    ),
    Product(
      name: 'Product 3',
      price: 20.00,
      originalPrice: 25.00,
      quantity: 3,
      imagePath: ImageAssets.dogMedicine,
    ),
    // Add more products as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        backgroundColor: Color(0xffF8F8F8),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button press
          },
        ),
        title: Text('Your Cart'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Colors.white,
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Row(
                    children: [
                      Image.asset(ImageAssets.dogMedicine),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style:
                                  footNoteRegular(color: ColorManager.primary),
                            ),
                            20.addVerticalSpace,
                            Row(
                              children: [
                                Text(
                                  '\$${product.price.toStringAsFixed(2)}',
                                  style: bodyBoldPrimary,
                                ),
                                5.horizontalSpace,
                                Text(
                                  '\$${(product.originalPrice - product.price).toStringAsFixed(2)}',
                                  style: captionRegularLine,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            onPressed: () {
                              // Handle increment button press
                            },
                          ),
                          Text('${product.quantity}'),
                          IconButton(
                            icon: Icon(Icons.remove_circle_outline_rounded),
                            onPressed: () {
                              // Handle decrement button press
                            },
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
            Text(
              'Subtotal: \$${calculateSubtotal().toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18.0, color: Colors.green),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_circle_outline,
              color: Colors.green,
              size: 36.0,
            ),
            color: ColorManager.primary,
          ),
          ElevatedButton(
            child: Text("Checkout"),
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
