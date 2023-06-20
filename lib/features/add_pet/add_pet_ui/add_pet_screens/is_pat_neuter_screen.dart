part of add_shop_screens;

class IsPetNeuterScreen extends StatelessWidget implements PageWidget {
  IsPetNeuterScreen({
    Key? key,
  }) : super(key: key);

  SizeConfig sizeConfig = locator<SizeConfig>();

  @override
  void onPressedFunction() {
    debugPrint('Page IsPetNeuterScreen action');
    // Add your custom functionality for Page 1 here
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("This is indie build in IsPetNeuter");
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: sizeConfig.getScreenWidth(AppSize.s32)),
      child: Column(
        children: [
          const Text(
            "Is your pet neuter?",
            textAlign: TextAlign.center,
            style: h3Bold,
          ),
          const RVerticalSpace(height: AppSize.s48),
          Consumer<AddPetProvider>(
            builder: (context, provider, child) => SizedBox(
                width: sizeConfig.getScreenWidth(220),
                height: sizeConfig.getScreenHeight(100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IsPetNeuterWidget(
                      onTap: () =>
                          provider.selectOption(PetNeuterOption.neuter),
                      isSelected:
                          provider.selectedOption == PetNeuterOption.neuter
                              ? true
                              : false,
                      title: "Yes",
                    ),
                    IsPetNeuterWidget(
                      onTap: () =>
                          provider.selectOption(PetNeuterOption.notNeuter),
                      isSelected:
                          provider.selectedOption == PetNeuterOption.notNeuter
                              ? true
                              : false,
                      title: "No",
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
