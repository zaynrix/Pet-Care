part of add_pet_module;
class AddPetNameScreen extends StatelessWidget implements PageWidget{
  AddPetNameScreen({
    Key? key,
  }) : super(key: key);

  final AddPetController addPetController = Get.find();
  final TextEditingController petNameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onPressedFunction() {
    debugPrint('Page AddPetNameScreen action');
    if(formKey.currentState!.validate()){
      addPetController.goNextScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("This is indie build in add name");
    return Padding(
      padding: AppSize.s32.paddingHorizontal,
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const Text(
              "What’s the name\n of your pet?",
              textAlign: TextAlign.center,
              style: h3Bold,
            ),
            const RVerticalSpace(height: AppSize.s24),
            CustomTextFormField(
              hintText: "Type Name",
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
