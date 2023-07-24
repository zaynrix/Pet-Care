part of add_shop_module;

class AddPetBreedScreen extends StatelessWidget implements PageWidget{
  AddPetBreedScreen({
    Key? key,
  }) : super(key: key);

  SizeConfig sizeConfig = sl<SizeConfig>();
  TextEditingController petNameController = TextEditingController();
  @override
  void onPressedFunction() {
    debugPrint('Page AddPetBreedScreen action');
    // Add your custom functionality for Page 1 here
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("This is indie build in add Breed");
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeConfig.getScreenWidth(AppSize.s32)),
      child: Column(
        children: [
          const Text(
            "What about\n your pet’s breed?",
            textAlign: TextAlign.center,
            style: h3Bold,
          ),
          const RVerticalSpace(height: AppSize.s24),
          CustomTextFormField(
            hintText: "Type pet's breed",
            validator: (String? value) => value!.validateUserName(),
            keyBoardType: TextInputType.name,
            controller: petNameController,
          )
        ],
      ),
    );
  }
}
