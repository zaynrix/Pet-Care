import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care/common_widgets/customTextFormField.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/route.dart';
import 'package:pet_care/routing/route_generator.dart';
import 'package:pet_care/utils/validate_extension.dart';

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
            RouteService.serviceNavi.popFunction();
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
              addVerticalSpace(AppSize.s45.h),
              Text(
                "Enter the phone number associated\n with your account and we'll send a\n code to reset your password",
                textAlign: TextAlign.center,
                style: supTitleRegular(color: ColorManager.primary),
              ),
              addVerticalSpace(AppSize.s33.h),
              CustomTextFormField(
                keyBoardType: TextInputType.phone,
                hintText: "Phone Number",
                controller: phoneController,
                validator: (String? value) => value!.validatePhoneNumber(),
              ),
              const Spacer(flex: 1,),
              ElevatedButton(onPressed: (){
                if(formKye.currentState!.validate()){
                  debugPrint("Its Ok Pro");
                  RouteService.serviceNavi.pushNamedWidget(RouteGenerator.verifyEmailScreen);
                }
              }, child: const Text("Submit")),
              const Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
}
