part of auth_module;

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController =
      TextEditingController(text: "test@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "mmMM112233@@");
  final GlobalKey<FormState> formKye = GlobalKey<FormState>();
  final SizeConfig sizeConfig = sl<SizeConfig>();

  @override
  Widget build(BuildContext context) {
    debugPrint("This is inside build method \n \n");
    return Consumer<AuthProvider>(
      builder: (context, auth, child) => Stack(
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
                  Text("Test Email : test@gmail.com"),
                  Text("Test Password : mmMM112233@@"),
                  const RVerticalSpace(height: AppSize.s15),
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
                    textInputAction: TextInputAction.next,
                    focus: (_) => FocusScope.of(context).nearestScope,
                    hintText: "test@gmail.com",
                    controller: emailController,
                    validator: (String? value) => value!.validateEmail(),
                    keyBoardType: TextInputType.emailAddress,
                  ),
                  const RVerticalSpace(height: AppSize.s20),
                  CustomTextFormField(
                    focus: (_) => FocusScope.of(context).nearestScope,
                    hintText: "mmMM112233@@",
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
                            AppStrings.forgotPassword,
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
                                  debugPrint("Its ok pro");
                                  auth.login(
                                      email: emailController.text,
                                      password: passwordController.text);
                                }
                              },
                              child: const Text(AppStrings.signIn)))
                    ],
                  ),
                  const RVerticalSpace(height: AppSize.s40),
                ],
              ),
            ),
          ),
          Visibility(
            visible: auth.isLoading,
            child: Container(
              height: Get.height,
              width: Get.width,
              color: ColorManager.primaryWithTransparent10,
              child: const LoadingStatusWidget(
                loadingStatus: LoadingStatusOption.loading,
              ),
            ),
          )
        ],
      ),
    );
  }
}
