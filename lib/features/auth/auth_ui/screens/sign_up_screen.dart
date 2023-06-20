part of auth_screens;
class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKye = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: ColorManager.soft,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
            child: Form(
              key: formKye,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const RVerticalSpace(height: AppSize.s100),
                  Text(
                    "Welcome aboard!",
                    style: h2Regular(color: ColorManager.primary),
                  ),
                  Text(
                    "Please sign up to continue ",
                    style: bodyRegular(color: ColorManager.primary),
                  ),
                  const RVerticalSpace(height: AppSize.s40),
                  CustomTextFormField(
                      hintText: "Name",
                      controller: emailController,
                      validator: (String? value) => value!.validateUserName(), keyBoardType: TextInputType.name,),
                  const RVerticalSpace(height: AppSize.s20),
                  CustomTextFormField(
                    keyBoardType: TextInputType.emailAddress,
                      hintText: "E-mail",
                      controller: passwordController,
                      validator: (String? value) => value!.validatePassword()),
                  const RVerticalSpace(height: AppSize.s20),
                  CustomTextFormField(
                    keyBoardType: TextInputType.phone,
                      hintText: "Phone number",
                      controller: emailController,
                      validator: (String? value) => value!.validatePhoneNumber()),
                  const RVerticalSpace(height: AppSize.s20),
                  CustomTextFormField(
                      hintText: "Password",
                      controller: emailController,
                      validator: (String? value) => value!.validatePassword(), keyBoardType: TextInputType.visiblePassword,),
                  const RVerticalSpace(height: AppSize.s80),
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
                          width: 183.w,
                          child: ElevatedButton(
                              onPressed: () {
                                if(formKye.currentState!.validate()){
                                  debugPrint("This is ok");
                                }
                              }, child: const Text("Sign un")))
                    ],
                  ),
                 const RVerticalSpace(height: AppSize.s40),
                ],
              ),
            ),
          ),
        ));
  }
}
