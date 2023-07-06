part of shop_screens;

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: const Text("Keep browsing"),
        onPressed: () {},
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: 64.paddingVertical,
                child: SvgPicture.asset(SvgAssets.successAddPet),
              ),
              Text(
                "Order placed successfully",
                style: h3Bold,
              ),
              Text(
                "You placed the order successfully. Thanks for using our services.",
                style: supTitleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
