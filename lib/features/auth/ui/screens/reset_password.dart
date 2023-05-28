import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care/common_widgets/customTextFormField.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/route.dart';
import 'package:pet_care/routing/route_generator.dart';
import 'package:pet_care/utils/validate_extension.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKye = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soft,
      appBar: AppBar(
        title: const Text("Reset Password"),
        leading: IconButton(
          onPressed: () {
            RouteService.serviceNavi.popFunction();
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
              addVerticalSpace(AppSize.s45.h),
              Text(
                "Enter a new password",
                style: supTitleRegular(color: ColorManager.primary),
              ),
              addVerticalSpace(AppSize.s33.h),
              CustomTextFormField(
                hintText: "New password",
                controller: passwordController,
                validator: (String? value) => value!.validatePassword(),
                keyBoardType: TextInputType.visiblePassword,
              ),
              addVerticalSpace(AppSize.s20.h),
              CustomTextFormField(
                hintText: "Confirm new password",
                controller: confirmPasswordController,
                validator: (String? value) => value!.validatePassword(),
                keyBoardType: TextInputType.visiblePassword,
              ),
              addVerticalSpace(AppSize.s120.h),
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
