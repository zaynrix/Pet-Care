import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_care/features/onboarding/core/on_boarding_provider.dart';
import 'package:pet_care/features/onboarding/model/onBoardingModel.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/route.dart';
import 'package:pet_care/routing/route_generator.dart';
import 'package:provider/provider.dart';
import 'descriptionOnboading.dart';
import 'sliderIndicator.dart';
import 'titlOnBoarding.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final List<OnBoardingModel> list = OnBoardingModel.data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<OnBoardingProvider>(context, listen: false)
        .initStateOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnBoardingProvider>(
        builder: (context, provider, child) => Column(
          children: [
            addVerticalSpace(AppSize.s100.h),
            Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                alignment: Alignment.center,
                child: PageView.builder(
                  onPageChanged: (value) =>
                    provider.onoPageChange(value)
                  ,
                    itemCount: list.length,
                    controller: provider.controller,
                    itemBuilder: (context, index) {
                      return SvgPicture.asset(
                        list[provider.activeIndex].svgPath,
                        fit: BoxFit.scaleDown,
                      );
                    })),
            addVerticalSpace(AppSize.s15.h),
            TitleOnBoarding(list: list, activeIndex: provider.activeIndex),
            addVerticalSpace(AppSize.s10.h),
            DescriptionOnBoarding(
                list: list, activeIndex: provider.activeIndex),
            addVerticalSpace(AppSize.s50.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(list.length, (index) => Indicator(activeIndex: index, currantPage: provider.currantPage,)),
            ),
            addVerticalSpace(AppSize.s35.h),
            if (provider.activeIndex + 1 != list.length)
              ElevatedButton(
                onPressed: () {
                  provider.controller.nextPage(
                      duration: const Duration(milliseconds: 150),
                      curve: Curves.ease);
                },
                child: const Text("Next"),
              ),
            if (provider.activeIndex + 1 >= list.length)
              ElevatedButton(
                onPressed: () {
                  RouteService.serviceNavi
                      .pushNamedReplacement(RouteGenerator.mainAuthScreen);
                },
                child: const Text('Get started'),
              ),
            addVerticalSpace(AppSize.s20.h),
            if (provider.activeIndex + 1 != list.length)
            TextButton(
                onPressed: () {
                  RouteService.serviceNavi
                      .pushNamedReplacement(RouteGenerator.mainAuthScreen);
                },
                child: Text(
                  "Skip",
                  style: bodyRegular(color: ColorManager.secondary),
                )),
            addVerticalSpace(AppSize.s20.h)
          ],
        ),
      ),
    );
  }
}
