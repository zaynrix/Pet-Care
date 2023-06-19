part of add_shop_screens;
class SuccessAddPatScreen extends StatelessWidget {
  SuccessAddPatScreen({Key? key}) : super(key: key);
  SizeConfig sizeConfig = locator<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: sizeConfig.getScreenWidth(AppSize.s48)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s130)),
            SvgPicture.asset(SvgAssets.successAddPet),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s32)),
            const Text(
              "Successfully added!",
              style: h3Bold,
            ),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s10)),
            const Text("Now you can enjoy\n our all services.",
                style: supTitleMedium,
                textAlign: TextAlign.center),
            const Spacer(),
            ElevatedButton(
                onPressed: () {}, child: const Text("Add another Pet")),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s20)),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Go to home page",
                  style: bodyRegular(color: ColorManager.secondary),
                )),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s40)),
          ],
        ),
      ),
    );
  }
}
