part of auth_module;

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);

  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soft,
      appBar: AppBar(
        title: const Text("Forgot password"),
        leading: IconButton(
          onPressed: () {
            RouteService.serviceNavi.pop();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
        child: Form(
          key: formKye,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const RVerticalSpace(height: AppSize.s45),
              const Text(
                "Enter the phone number associated\n with your account and we'll send a\n code to reset your password",
                textAlign: TextAlign.center,
                style: supTitleRegular,
              ),
              const RVerticalSpace(height: AppSize.s33),
              CustomTextFormField(
                keyBoardType: TextInputType.phone,
                hintText: "Phone Number",
                controller: phoneController,
                validator: (String? value) => value!.validatePhoneNumber(),
              ),
              const Spacer(
                flex: 1,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKye.currentState!.validate()) {
                      debugPrint("Its Ok Pro");
                      RouteService.serviceNavi
                          .pushNamedWidget(RouteGenerator.verifyEmailScreen);
                    }
                  },
                  child: const Text("Submit")),
              const Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
