part of auth_module;
class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.soft,
      appBar: AppBar(
        title: const Text("Reset Password"),
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
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p24.w),
        child: Form(
          key: formKye,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             const RVerticalSpace(height: AppSize.s45),
              const Text(
                "Enter a new password",
                style: supTitleRegular,
              ),
              const RVerticalSpace(height: AppSize.s33),
              CustomTextFormField(
                hintText: "New password",
                controller: passwordController,
                validator: (String? value) => value!.validatePassword(),
                keyBoardType: TextInputType.visiblePassword,
              ),
              const RVerticalSpace(height: AppSize.s20),
              CustomTextFormField(
                hintText: "Confirm new password",
                controller: confirmPasswordController,
                validator: (String? value) => value!.validatePassword(),
                keyBoardType: TextInputType.visiblePassword,
              ),
             const RVerticalSpace(height: AppSize.s120),
              ElevatedButton(
                  onPressed: () {
                    if (formKye.currentState!.validate()) {
                      debugPrint("This is ok");
                      RouteService.serviceNavi.pushNamedReplacement(RouteGenerator.mainAuthScreen);
                    }
                  },
                  child: const Text("Change")),
            ],
          ),
        ),
      ),
    );
  }
}
