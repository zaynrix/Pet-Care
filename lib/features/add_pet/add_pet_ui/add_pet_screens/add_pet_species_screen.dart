part of add_pet_module;

class AddPetSpeciesScreen extends StatelessWidget implements PageWidget{
  AddPetSpeciesScreen({
    Key? key,
  }) : super(key: key);

  final AddPetController addPetController = Get.find();

  @override
  void onPressedFunction() {
    debugPrint('Page AddPhotoForPetScreen action');
    addPetController.selectPetType();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("This is inside the add pet species build page ");
    return SizedBox(
      // width: MediaQuery.of(context).size.width,
      // height: sizeConfig.getScreenHeight(350),
      child: Column(
        children: [
          const Text(
            "What’s your pet’s\n species?",
            textAlign: TextAlign.center,
            style: h3Bold,
          ),
          const RVerticalSpace(height: AppSize.s64),
          Expanded(
            child: GetBuilder<AddPetController>(
              builder: (GetxController controller) => ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: addPetController.types.length,
                  itemBuilder: (context, index) {
                    final type = addPetController.types[index];
                    return
                      SelectionTypeCard(
                      onTap: () {
                        addPetController.choosePetType(type: type.name);
                      },
                      isSelected: type.isSelect,
                      type: type.name,
                      iconPath: type.iconPath,
                      backgroundColor: type.backgroundColor,
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
