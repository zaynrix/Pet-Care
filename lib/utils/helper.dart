import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pet_care/common_widgets/common_widgets.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/enums.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';

import '../resources/colors_manager.dart';

class Helpers {
  static final GlobalKey<ScaffoldMessengerState> scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static showDialog({required String message}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: 16.circularRadius),
      backgroundColor: ColorManager.white,
      child: Padding(
        padding: AppPadding.p24.paddingAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LoadingStatusWidget(
              loadingStatus: LoadingStatusOption.error,
            ),
            Text(message)
          ],
        ),
      ),
    ));
    Future.delayed(const Duration(seconds: 3), () {
      Get.back();
    });
  }

  static showSnackBar({required String message}) {
    debugPrint("ssss");
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: ColorManager.error,
      elevation: 10,
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: ColorManager.secondary,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8.0.r),
      ),
      behavior: SnackBarBehavior.floating,
    ));
    debugPrint("After Snak");
  }

  static balanceShowSnackBar({required String message}) {
    debugPrint("ssss");
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("IconAssets.doneIcon"),
          addHorizontalSpace(AppSize.s10.w),
          Text(
            message,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                fontFamily: "Segoe UI",
                color: ColorManager.primary),
          )
        ],
      ),
      duration: const Duration(seconds: 3),
      backgroundColor: const Color(0xFFE9F7E7),
      elevation: 5,
      margin: EdgeInsetsDirectional.only(
          bottom: AppSize.s250.h,
          start: AppPadding.p25.w,
          end: AppPadding.p25.w),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color(0xFF70B668), width: 1),
        borderRadius: BorderRadius.circular(3.r),
      ),
      behavior: SnackBarBehavior.floating,
    ));
    debugPrint("After Snack");
  }
}

class alertDialog extends StatelessWidget {
  alertDialog({super.key, required this.content, required this.onPressed});

  final String content;
  dynamic Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0.r))),
      backgroundColor: ColorManager.white,
      actionsPadding: EdgeInsets.symmetric(horizontal: AppPadding.p22.w),
      title: Row(
        children: [
          const Spacer(),
          IconButton(
            onPressed: () {
              RouteService.serviceNavi.pop();
            },
            icon: const Icon(
              Icons.cancel,
              color: Color(0xFF606060),
              size: 29,
            ),
          ),
        ],
      ),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 23),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorManager.redLight,
                  fixedSize: Size(112.w, 40.h)),
              child: const Text("Ok"),
            ),
            ElevatedButton(
              onPressed: () => RouteService.serviceNavi.pop(),
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(color: ColorManager.primary, width: 1),
                  backgroundColor: ColorManager.white,
                  fixedSize: Size(112.w, 40.h)),
              child: const Text("Cancel"),
            ),
          ],
        )
        // TextButton(onPressed: onPressed, child: const Text("Ok")),
        // TextButton(onPressed: () => Navigator.pop(context), child: const Text("Cancel")),
      ],
    );
  }
}

class BalanceAlertDialog extends StatelessWidget {
  BalanceAlertDialog(
      {required this.content,
      required this.isLoading,
      required this.onPressed,
      Key? key})
      : super(key: key);

  final String content;
  final Function() onPressed;
  bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //this right here
      child: SizedBox(
        height: 180.h,
        child: Stack(children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  RouteService.serviceNavi.pop();
                },
                icon: const Icon(
                  Icons.cancel,
                  size: 20,
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p22.w, vertical: AppPadding.p32.h),
            child: Column(
              children: [
                addVerticalSpace(AppSize.s5.h),
                Text(
                  content,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                addVerticalSpace(AppSize.s25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: AppSize.s35.h,
                        width: AppSize.s120.w,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              side: const BorderSide(
                                  color: ColorManager.primary, width: 1),
                              backgroundColor: ColorManager.white,
                            ),
                            onPressed: () {
                              RouteService.serviceNavi.pop();
                            },
                            child: Text(
                              "Cancel",
                              style: Theme.of(context).textTheme.bodyText2,
                            ))),
                    SizedBox(
                      height: AppSize.s35.h,
                      width: AppSize.s120.w,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: ColorManager.redLight,
                              disabledBackgroundColor:
                                  ColorManager.redLight.withOpacity(0.4)),
                          onPressed: isLoading ? null : onPressed,
                          child: isLoading
                              ? const CircularProgressIndicator()
                              : Text(
                                  "Delete",
                                  style: Theme.of(context).textTheme.bodyText2,
                                )),
                    )
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}
