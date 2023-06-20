part of auth_screens;

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKye = GlobalKey<FormState>();
  final SizeConfig sizeConfig = locator<SizeConfig>();

  //
  // top: MediaQuery.of(context).size.height * 0.25,
  // start: MediaQuery.of(context).size.width * 0.3,

  @override
  Widget build(BuildContext context) {
    debugPrint("This is inside build method \n \n");
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorManager.soft,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
              child: Form(
                key: formKye,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RVerticalSpace(height: AppSize.s115),
                    Text(
                      "Welcome back",
                      style: h2Regular(color: ColorManager.primary),
                    ),
                    const Text(
                      "pet lover...",
                      style: h2Bold,
                    ),
                    const RVerticalSpace(height: AppSize.s35),
                    CustomTextFormField(
                      hintText: "E-mail",
                      controller: emailController,
                      validator: (String? value) => value!.validateEmail(),
                      keyBoardType: TextInputType.emailAddress,
                    ),
                    const RVerticalSpace(height: AppSize.s20),
                    CustomTextFormField(
                      hintText: "Password",
                      controller: passwordController,
                      validator: (String? value) => value!.validatePassword(),
                      keyBoardType: TextInputType.visiblePassword,
                    ),
                    const RVerticalSpace(height: AppSize.s10),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {
                              RouteService.serviceNavi.pushNamedWidget(
                                  RouteGenerator.forgetPasswordScreen);
                            },
                            child: Text(
                              "Forgot password",
                              style: bodyRegular(color: ColorManager.secondary),
                            ))),
                    const Spacer(
                      flex: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: AppSize.s56.h,
                          width: AppSize.s56.w,
                          child: CircleAvatar(
                            backgroundColor: ColorManager.secondaryLight,
                            child: SvgPicture.asset(IconAssets.appleIcon),
                          ),
                        ),
                        SizedBox(
                          height: AppSize.s56.h,
                          width: AppSize.s56.w,
                          child: CircleAvatar(
                            backgroundColor: ColorManager.secondaryLight,
                            child: SvgPicture.asset(IconAssets.googleIcon),
                          ),
                        ),
                        SizedBox(
                            width: sizeConfig.getScreenWidth(183),
                            child: ElevatedButton(
                                onPressed: () {
                                  if (formKye.currentState!.validate()) {
                                    RouteService.serviceNavi.pushNamedWidget(
                                        RouteGenerator.mainAddPetScreen);
                                    debugPrint("Its ok pro");
                                  }
                                },
                                child: const Text("Sign in")))
                      ],
                    ),
                    const RVerticalSpace(height: AppSize.s40),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
