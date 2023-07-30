part of pets_module;

class EditGenderPetSheet extends StatelessWidget {
  const EditGenderPetSheet({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      decoration: BoxDecoration(
          color: ColorManager.white, borderRadius: AppSize.s25.circularRadius),
      child: Column(
        children: [
          Container(
              height: AppSize.s60.height,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: ColorManager.primaryWithTransparent10))),
              child: const Text(
                AppStrings.chooseYourPetGender,
                style: titleBold,
              )),
          AppSize.s30.addVerticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GenderCard(onTap: () {}, isSelected: false, iconPath: IconAssets.male,),
              GenderCard(onTap: () {}, isSelected: false, iconPath: IconAssets.female,),
            ],
          ),
          AppSize.s70.addVerticalSpace,
          ElevatedButton(
              onPressed: () {
                RouteService.serviceNavi.pop();
              },
              child: const Text(AppStrings.done)),
        ],
      ),
    );
  }
}
