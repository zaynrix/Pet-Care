part of auth_screens;
class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({Key? key}) : super(key: key);
  TextEditingController optController = TextEditingController();
  GlobalKey<FormState> formKye = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
        child: Form(
          key: formKye,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              addVerticalSpace(AppSize.s45.h),
              const Text("Enter the code we just sent" , style: supTitleRegular),
              addVerticalSpace(AppSize.s28.h),
              Pinput(
                androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
                validator: (String? value) => value!.validateCode(),
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
                    textStyle: bodyBoldPrimary,
                    // margin: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      color: ColorManager.white,
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
              const Spacer(),
              ElevatedButton(onPressed: (){
                if(formKye.currentState!.validate()){
                  debugPrint("This is ok");
                  RouteService.serviceNavi.pushNamedWidget(RouteGenerator.resetPasswordScreen);
                }
              }, child: const Text("Next")),
              const Spacer(flex: 2,)
            ],
          ),
        ),
      ),
    );
  }
}
