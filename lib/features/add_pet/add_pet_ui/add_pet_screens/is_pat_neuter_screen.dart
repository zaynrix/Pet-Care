part of add_pet_module;

class IsPetNeuterScreen extends StatelessWidget implements PageWidget {
  IsPetNeuterScreen({
    Key? key,
  }) : super(key: key);

  final AddPetController addPetController = Get.find();

  @override
  void onPressedFunction() {
    debugPrint('Page IsPetNeuterScreen action');
    addPetController.selectPetNeuter();
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
          GetBuilder<AddPetController>(
            builder: (GetxController controller) => SizedBox(
                width: sizeConfig.getScreenWidth(220),
                height: sizeConfig.getScreenHeight(100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IsPetNeuterWidget(
                      onTap: () =>
                          addPetController.chooseNatureOption(PetNeuterOption.neuter),
                      isSelected:
                      addPetController.selectedOption == PetNeuterOption.neuter
                              ? true
                              : false,
                      title: "Yes",
                    ),
                    IsPetNeuterWidget(
                      onTap: () =>
                          addPetController.chooseNatureOption(PetNeuterOption.notNeuter),
                      isSelected:
                      addPetController.selectedOption == PetNeuterOption.notNeuter
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
