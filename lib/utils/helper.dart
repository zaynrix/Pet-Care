import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  static showDialog({required String message , required LoadingStatusOption status}) {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(borderRadius: 16.circularRadius),
      backgroundColor: ColorManager.white,
      child: Padding(
        padding: AppPadding.p24.paddingAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingStatusWidget(
              loadingStatus: status,
            ),
            Text(message)
          ],
        ),
      ),
    ));
      Future.delayed(const Duration(seconds: 2), () {
        Get.back();
      });


  }

  static showSnackBar({required String message}) {
    scaffoldKey.currentState?.showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
      backgroundColor: ColorManager.error,
      elevation: 10,
      // margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0.r),
      ),
      behavior: SnackBarBehavior.floating,
    ));
    debugPrint("After Snak");
  }

}

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.content, required this.onPressed});

  final String content;
  final Function() onPressed;

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

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}
