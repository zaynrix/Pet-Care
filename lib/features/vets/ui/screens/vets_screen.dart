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
                  horizontal: AppSize.s24.width, vertical: 17.height),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage:
                    CachedNetworkImageProvider(
                        "https://media.glamour.com/photos/569669a9eaefd309768dd95e/master/w_1600%2Cc_limit/health-fitness-blogs-vitamin-g-0708-concierge-doctor_vg.jpg"
                    ),
                  ),
                  AppSize.s18.addHorizontalSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Abram Curtis", style: bodyBoldPrimary,),
                      AppSize.s5.addVerticalSpace,
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
                              child: Text("Start consult | \$12.99", style: footNoteRegular(color: ColorManager.white),)))
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
