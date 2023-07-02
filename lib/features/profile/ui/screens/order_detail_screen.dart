part of profile_module;

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key}) : super(key: key);
  final int listCount = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order detail"),
        leading: Row(
          children: [
            AppSize.s15.addHorizontalSpace,
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: AppSize.s40.marginBottom,
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("Reorder"),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: AppPadding.p24.paddingHorizontal,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: AppSize.s15.circularRadius,
                      color: ColorManager.white),
                  padding: AppSize.s16.paddingAll,
                  child: Container(
                    padding: AppSize.s10.paddingHorizontal,
                    decoration: const BoxDecoration(
                        color: ColorManager.white,
                        border: Border(
                            left: BorderSide(
                                color: ColorManager.secondaryLight, width: 3))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Shipped",
                              style: bodyMedium,
                            ),
                            const Spacer(),
                            SvgPicture.asset(IconAssets.rightBack)
                          ],
                        ),
                        const Text(
                          "May 21, 2022 • 04:48 PM",
                          style: captionRegularPrimary,
                        ),
                        const Text(
                          "5616 Artesian Dr Derwood, Maryland(MD) 20855",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: captionRegular,
                        )
                      ],
                    ),
                  ),
                ),
                AppSize.s24.addVerticalSpace,
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: AppPadding.p16.width,
                        vertical: AppPadding.p32.height),
                    decoration: BoxDecoration(
                      borderRadius: AppSize.s16.circularRadius,
                      color: ColorManager.white,
                    ),
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listCount + 1,
                        itemBuilder: (context, index) {
                          // if(){
                          //
                          // }
                          return index != listCount
                              ? const OrderDetailCard(
                                  title:
                                      "1x Naturel Promise Fresh Dental Water Additive18 fl oz",
                                  imagePath: ImageAssets.productDetails,
                                  price: "29.98",
                                )
                              : Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Sub Total",
                                          style: footNoteRegular(
                                              color: ColorManager.primary),
                                        ),
                                        const Spacer(),
                                        const Text(
                                          "\$90.22",
                                          style: bodyBoldPrimary,
                                        )
                                      ],
                                    ),
                                    AppSize.s12.addVerticalSpace,
                                    Row(
                                      children: [
                                        Text(
                                          "Delivery",
                                          style: footNoteRegular(
                                              color: ColorManager.primary),
                                        ),
                                        const Spacer(),
                                        const Text(
                                          "Free",
                                          style: bodyBoldSecondary,
                                        )
                                      ],
                                    ),
                                    AppSize.s12.addVerticalSpace,
                                    Row(
                                      children: [
                                        Text(
                                          "Total",
                                          style: footNoteRegular(
                                              color: ColorManager.primary),
                                        ),
                                        const Spacer(),
                                        const Text(
                                          "\$90.22",
                                          style: bodyBoldPrimary,
                                        )
                                      ],
                                    ),
                                    AppSize.s100.addVerticalSpace
                                  ],
                                );
                        }),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 375.width,
              height: 200.height,
              // color: Colors.white.withOpacity(0.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.00, -1.00),
                  end: const Alignment(0, 1),
                  colors: [Colors.white.withOpacity(0), Colors.white],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
