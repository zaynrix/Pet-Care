part of vets_module;

class VetsScreen extends StatelessWidget {
  const VetsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("available veterinarians"),
      ),
      body: Padding(
        padding: AppPadding.p24.paddingHorizontal,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: AppSize.s16.circularRadius,
                  boxShadow: [customShadow()]),
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.s24.width, vertical: AppSize.s16.height),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage:
                    CachedNetworkImageProvider(
                        ""
                    ),
                  ),
                  AppSize.s18.addHorizontalSpace,
                  Column(
                    children: [
                      const Text("Abram Curtis", style: bodyBoldPrimary,),
                      Text("Veterinary" , style: footNoteRegular(color: ColorManager.gray),),
                      AppSize.s8.addHorizontalSpace,
                      Row(
                        children: [
                          RatingStars(rating: 4,),
                          AppSize.s8.addHorizontalSpace,
                          Text("(32)" , style: footNoteRegular(color: ColorManager.gray))
                        ],
                      ),
                      AppSize.s16.addVerticalSpace,
                      SizedBox(
                        width: 184.width,
                          height: 35.height,
                          child: ElevatedButton(onPressed: (){},
                              child: Row(
                                children: [
                                  Text("Start consult | ", style: footNoteRegular(color: ColorManager.white),),
                                  Text("\$12.99" , ),
                                ],
                              )))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
