part of profile_module;

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
        leading: Row(
          children: [
            AppSize.s15.addHorizontalSpace,
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: AppPadding.p24.paddingHorizontal,
            child: Container(
              padding: AppPadding.p16.paddingAll,
              decoration: BoxDecoration(
                borderRadius: AppSize.s16.circularRadius,
                color: ColorManager.white
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: AppSize.s10.paddingHorizontal,
                    decoration: const BoxDecoration(
                      border: Border(left: BorderSide(color: ColorManager.secondaryLight ,width: 3))
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("Shipped", style: bodyMedium,),
                            Spacer(),
                            SvgPicture.asset(IconAssets.rightBack)
                          ],
                        ),
                        const Text("May 21, 2022 • 04:48 PM", style: captionRegularPrimary,),
                        Text("5616 Artesian Dr Derwood, Maryland(MD) 20855", maxLines: 1, overflow: TextOverflow.ellipsis, style: captionRegular,)
                      ],
                    ),
                  ),
                  AppSize.s16.addVerticalSpace,
                  Row(
                    children: [
                      Container(
                        padding: AppSize.s6.paddingAll,
                        height: AppSize.s40.height,
                        width: AppSize.s40.width,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorManager.secondGray)
                        ),
                        child: Image.asset(ImageAssets.productDetails),
                      ),
                      Container(
                        padding: AppSize.s6.paddingAll,
                        height: AppSize.s40.height,
                        width: AppSize.s40.width,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: ColorManager.secondGray)
                        ),
                        child: Image.asset(ImageAssets.productDetails),
                      ),
                    ],
                  ),
                  AppSize.s10.addVerticalSpace,
                  Row(
                    children: [
                      const Text("\$64.95" , style: bodyBoldPrimary,),
                      const Spacer(),
                      SizedBox(
                        height: AppSize.s32.height,
                        width: AppSize.s115.width,
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text("Reorder", style: footNoteRegular(color: ColorManager.white),),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
