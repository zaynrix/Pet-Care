part of add_pet_module;

class AddPetBreedScreen extends StatelessWidget implements PageWidget{
  AddPetBreedScreen({
    Key? key,
  }) : super(key: key);

  final AddPetController addPetController = Get.find();
  final TextEditingController petNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onPressedFunction() {
    debugPrint('Page AddPetBreedScreen action');
    addPetController.addPetBreed(breed: petNameController.text);

    // Add your custom functionality for Page 1 here
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("This is indie build in add Breed");
    return Padding(
      padding: AppSize.s32.paddingHorizontal,
      child: Form(
        key: formKey,
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
              validator: (String? value) => value!.validatePetName(),
              keyBoardType: TextInputType.name,
              controller: petNameController,
            )
          ],
        ),
      ),
    );
  }
}
