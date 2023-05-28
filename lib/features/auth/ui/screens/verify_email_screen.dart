import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/route.dart';
import 'package:pet_care/utils/validate_extension.dart';
import 'package:pinput/pinput.dart';

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({Key? key}) : super(key: key);
  TextEditingController optController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.soft,
      appBar: AppBar(
        title: const Text("Verify"),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            addVerticalSpace(AppSize.s45.h),
            Text("Enter the code we just sent" , style: supTitleRegular(color: ColorManager.primary),),
            addVerticalSpace(AppSize.s28.h),
            Pinput(
              androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
              validator: (String? value) => value!.validateUserName(),
              controller: optController,
              obscureText: false,
              length: 5,
              focusedPinTheme: PinTheme(
                  width: AppSize.s56.w,
                  height: AppSize.s56.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: ColorManager.secondary, width: 2),
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(AppSize.s16.r),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.gray.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(0, 3),// changes position of shadow
                      ),
                    ],
                  )),

              defaultPinTheme: PinTheme(
                  // margin: EdgeInsetsDirectional.only(end: AppMargin.m12.w),
                  width: AppSize.s56.w,
                  height: AppSize.s56.h,
                  textStyle: bodyBold(color: ColorManager.primary),
                  // margin: EdgeInsets.symmetric(horizontal: 5.w),
                  decoration: BoxDecoration(
                    color: ColorManager.whiteColor,
                    borderRadius: BorderRadius.circular(AppSize.s16.r),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.gray.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),

                    ],
                  )),
            ),
            addVerticalSpace(AppSize.s28.h),
            Text("00:59" , style: bodyRegular(color: ColorManager.secondary),),
            addVerticalSpace(AppSize.s8.h),
            TextButton(onPressed: (){}, child: Text('Resend code', style:  bodyRegular(color: ColorManager.gray),)),
            addVerticalSpace(AppSize.s128.h),
            ElevatedButton(onPressed: (){}, child: const Text("Next")),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
