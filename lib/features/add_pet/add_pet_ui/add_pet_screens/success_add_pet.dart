part of add_pet_module;

class SuccessAddPatScreen extends StatelessWidget {
  const SuccessAddPatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: AppSize.s48.paddingHorizontal,
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
                onPressed: () {RouteService.serviceNavi.pushNamedWidget(RouteGenerator.mainAddPetScreen);},
                child: const Text("Add another Pet")),
            const RVerticalSpace(height: AppSize.s20),
            TextButton(
                onPressed: () {
                  RouteService.serviceNavi.pushNamedWidget(RouteGenerator.mainScreenApp);
                },
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
