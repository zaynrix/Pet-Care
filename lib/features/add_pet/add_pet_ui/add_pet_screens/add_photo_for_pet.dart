part of add_pet_module;

class AddPhotoForPetScreen extends StatelessWidget implements PageWidget {
  AddPhotoForPetScreen({Key? key}) : super(key: key);

  final AddPetController addPetController = Get.find();

  @override
  void onPressedFunction() {
    debugPrint('Page AddPhotoForPetScreen action');

    addPetController.selectPitImage();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("This is indie build in add photo");
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p44),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Add a photo of your pet",
                style: h3Bold,
              ),
              addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s32)),
              GetBuilder<AddPetController>(
                builder: (GetxController controller) => Container(
                    height: sizeConfig.getScreenHeight(472),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: ColorManager.secondaryLight,
                        borderRadius: BorderRadius.circular(AppSize.s25)),
                    child: addPetController.fileImage == null
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.only(
                                    start:
                                        sizeConfig.getScreenWidth(AppSize.s25),
                                    top: sizeConfig
                                        .getScreenHeight(AppSize.s25)),
                                child: const Column(
                                  children: [
                                    Text(
                                      "Ghost",
                                      style: h2Bold,
                                    ),
                                    Text(
                                      "3 years old",
                                      style: supTitleMedium,
                                    )
                                  ],
                                ),
                              ),
                              addVerticalSpace(
                                  sizeConfig.getScreenHeight(AppSize.s70)),
                              Align(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  IconAssets.dogType,
                                  height: sizeConfig.getScreenHeight(178),
                                  width: sizeConfig.getScreenWidth(178),

                                ),
                              ),
                              addVerticalSpace(
                                  sizeConfig.getScreenHeight(AppSize.s66)),
                              Align(
                                alignment: Alignment.center,
                                child: InkWell(
                                  onTap: () {
                                    addPetController.pickImage();
                                  },
                                  child: Container(
                                    height:
                                        sizeConfig.getScreenHeight(AppSize.s44),
                                    width:
                                        sizeConfig.getScreenWidth(AppSize.s44),
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: ColorManager.primary)),
                                    child: SvgPicture.asset(IconAssets.plus),
                                  ),
                                ),
                              )
                            ],
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(AppSize.s25),
                            child: Image.file(
                              addPetController.fileImage!,
                              fit: BoxFit.cover,
                              // height: sizeConfig.getScreenHeight(472),
                            ),
                          )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
