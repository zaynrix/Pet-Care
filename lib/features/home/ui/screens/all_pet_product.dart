import 'package:flutter/material.dart';
import 'package:pet_care/common_widgets/custom_circularProgressIndicator.dart';
import 'package:pet_care/features/home/controllers/home_provider.dart';
import 'package:pet_care/features/shop/controllers/product_provider.dart';
import 'package:pet_care/features/shop/ui/widgets/shop_widgets.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';
import 'package:provider/provider.dart';

class AllPetProducts extends StatefulWidget {
  const AllPetProducts({Key? key}) : super(key: key);

  @override
  State<AllPetProducts> createState() => _AllPetProductsState();
}

class _AllPetProductsState extends State<AllPetProducts> {
  @override
  void initState() {
    super.initState();
    sl<ProductProvider>().getPetShopProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pet Shop"),
      ),
      body: Consumer2<ProductProvider, HomeProvider>(
        builder: (context, productProvider, homeProvider, child) =>
            productProvider.products == null
                ? const CustomCircularProgressIndicator()
                : Padding(
                    padding: 20.paddingVertical,
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns in the grid
                        crossAxisSpacing: 0.0, // Spacing between columns
                        mainAxisSpacing: 8.0, // Spacing between rows
                      ),
                      itemCount: productProvider.products!.products!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          productProvider.setProductObject(
                              current:
                                  productProvider.products!.products![index]);
                        },
                        child: ShodCardGrid(
                          onTap: () {
                            // setState(() {
                            //   instance.searchList[index].inCart !=
                            //       true
                            //       ? instance.searchList[index]
                            //       : instance.searchList[index];
                            //   instance.searchList[index].inCart =
                            //   instance
                            //       .searchList[index].inCart!;
                            // });
                          },
                          singleProduct:
                              productProvider.products!.products![index],
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
