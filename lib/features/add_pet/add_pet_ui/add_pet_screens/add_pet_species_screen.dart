part of add_shop_screens;

class AddPetSpeciesScreen extends StatelessWidget implements PageWidget{
  AddPetSpeciesScreen({
    Key? key,
  }) : super(key: key);

  final SizeConfig sizeConfig = locator<SizeConfig>();

  void onPressedFunction() {
    debugPrint('Page AddPhotoForPetScreen action');
    // Add your custom functionality for Page 1 here
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
          addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s64)),
          Expanded(
            child: Consumer<AddPetProvider>(
              builder: (context, provider, child) => ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: provider.types.length,
                  itemBuilder: (context, index) {
                    final type = provider.types[index];
                    return PetSpeciesCard(
                      onTap: () {
                        provider.selectPetType(type: type.name);
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
