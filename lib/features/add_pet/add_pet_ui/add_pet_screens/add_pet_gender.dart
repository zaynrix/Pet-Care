part of add_pet_module;

class AddPetGenderScreen extends StatelessWidget implements PageWidget {
  AddPetGenderScreen({
    Key? key,
  }) : super(key: key);

  final AddPetController addPetController = Get.find();

  @override
  void onPressedFunction() {
    debugPrint('Page AddPetGenderScreen action');
    addPetController.selectGender();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("This is indie build in add gender");
    return Padding(
      padding: AppSize.s32.paddingHorizontal,
      child: Column(
        children: [
          const Text(
            "What’s your pet’s \n gender?",
            textAlign: TextAlign.center,
            style: h3Bold,
          ),
          const RVerticalSpace(height: AppSize.s48),
          GetBuilder<AddPetController>(
            builder: (GetxController controller) => SizedBox(
              width: 201.width,
              height: AppSize.s100.height,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final gender = addPetController.genders[index];
                    return GenderCard(
                      iconPath: gender.iconPath,
                      isSelected: gender.isSelect,
                      onTap: () => addPetController.choosePetGender(type: gender.type),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      SizedBox(height: AppSize.s15.height),
                  itemCount: addPetController.genders.length),
            ),
          )
        ],
      ),
    );
  }
}
