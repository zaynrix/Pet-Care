import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/common_widgets/custom_circularProgressIndicator.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/utils/extension/responsive_extension.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(SvgAssets.successAddPet),
            50.addVerticalSpace,
            const CustomCircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
