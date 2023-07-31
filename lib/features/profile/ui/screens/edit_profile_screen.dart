part of profile_module;

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final UserModel profileData = sl<StorageService>().getUser();

  final GlobalKey<FormState> formKye = GlobalKey<FormState>();
  @override
  initState() {
    super.initState();
    nameController.text = profileData.name;
    emailController.text = profileData.email;
    phoneController.text = profileData.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          ElevatedButton(onPressed: () {}, child: const Text("Save")),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(AppStrings.profile),
        actions: [
          CustomIconButton(
            onTap: () {
              RouteService.serviceNavi.pop();
            },
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
