import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/common_widgets/customTextFormField.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/route.dart';
import 'package:pet_care/routing/route_generator.dart';
import 'package:pet_care/utils/validate_extension.dart';
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKye = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    debugPrint("This is inside build method \n \n");
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: ColorManager.soft,
        body:
        SingleChildScrollView(
          child: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
              child: ConstrainedBox(
                constraints:  BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height - 0.3,
                ),
                child: IntrinsicHeight(
                  child: Form(
                    key: formKye,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        addVerticalSpace(AppSize.s115.h),
                        Text(
                          "Welcome back",
                          style: h2Regular(color: ColorManager.primary),
                        ),
                        Text(
                          "pet lover...",
                          style: h2Bold(color: ColorManager.primary),
                        ),
                        addVerticalSpace(AppSize.s35.h),
                        CustomTextFormField(
                            hintText: "E-mail",
                            controller: emailController,
                            validator: (String? value) => value!.validateEmail(), keyBoardType: TextInputType.emailAddress,),
                        addVerticalSpace(AppSize.s20.h),
                        CustomTextFormField(
                            hintText: "Password",
                            controller: passwordController,
                            validator: (String? value) => value!.validatePassword(), keyBoardType: TextInputType.visiblePassword,),
                        addVerticalSpace(AppSize.s10.h),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  RouteService.serviceNavi.pushNamedWidget(RouteGenerator.forgetPassword);
                                },
                                child: Text(
                                  "Forgot password",
                                  style: bodyRegular(color: ColorManager.secondary),
                                ))),
                        // const Spacer(
                        //   flex: 2,
                        // ),
                        addVerticalSpace(AppSize.s150.h),
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
                                        debugPrint("Its ok pro");
                                      }
                                    }, child: const Text("Sign in")))
                          ],
                        ),
                        addVerticalSpace(AppSize.s40.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
