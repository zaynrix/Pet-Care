part of add_shop_module;

class SuccessAddPatScreen extends StatelessWidget {
  SuccessAddPatScreen({Key? key}) : super(key: key);
  SizeConfig sizeConfig = sl<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: sizeConfig.getScreenWidth(AppSize.s48)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const RVerticalSpace(height: AppSize.s130),
            SvgPicture.asset(SvgAssets.successAddPet),
            const RVerticalSpace(height: AppSize.s32),
            const Text(
              "Successfully added!",
              style: h3Bold,
            ),
            const RVerticalSpace(height: AppSize.s10),
            const Text("Now you can enjoy\n our all services.",
                style: supTitleMedium, textAlign: TextAlign.center),
            const Spacer(),
            ElevatedButton(
                onPressed: () {}, child: const Text("Add another Pet")),
            const RVerticalSpace(height: AppSize.s20),
            TextButton(
                onPressed: () {},
                child: Text(
                  "Go to home page",
                  style: bodyRegular(color: ColorManager.secondary),
                )),
            const RVerticalSpace(height: AppSize.s40),
          ],
        ),
      ),
    );
  }
}
