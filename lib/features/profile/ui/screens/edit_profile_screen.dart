part of profile_module;

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final GlobalKey<FormState> formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          ElevatedButton(onPressed: () {}, child: const Text("Save")),
      appBar: AppBar(
        title: const Text(AppStrings.profile),
        actions: [
          CustomIconButton(
            iconPath: IconAssets.cancel,
          ),
          AppSize.s30.addHorizontalSpace
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.p24.paddingHorizontal,
          child: Form(
            key: formKye,
            child: Column(
              children: [
                AppSize.s32.addVerticalSpace,
                CustomTextFormField(
                    hintText: "Name",
                    controller: nameController,
                    validator: (value) => value!.validateUserName(),
                    keyBoardType: TextInputType.name),
                AppSize.s20.addVerticalSpace,
                CustomTextFormField(
                    hintText: "E-mail",
                    controller: emailController,
                    validator: (value) => value!.validateEmail(),
                    keyBoardType: TextInputType.emailAddress),
                AppSize.s20.addVerticalSpace,
                CustomTextFormField(
                    hintText: "Phone number",
                    controller: phoneController,
                    validator: (value) => value!.validatePhoneNumber(),
                    keyBoardType: TextInputType.phone),
                AppSize.s100.addVerticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
