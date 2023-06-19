import 'package:flutter/material.dart';
import 'package:pet_care/features/onboarding/core/on_boarding_provider.dart';
import 'package:pet_care/features/onboarding/model/onBoardingModel.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/colors_manager.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/resources/styles_manager.dart';
import 'package:pet_care/resources/values_manager.dart';
import 'package:pet_care/routing/routing_imports.dart';
import 'package:provider/provider.dart';
import 'onboarding_widgets/descriptionOnboading.dart';
import 'onboarding_widgets/sliderIndicator.dart';
import 'onboarding_widgets/titlOnBoarding.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final List<OnBoardingModel> list = OnBoardingModel.data;
  SizeConfig sizeConfig = locator<SizeConfig>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<OnBoardingProvider>(context, listen: false)
        .initStateOnBoarding();
  }

  @override
  Widget build(BuildContext context) {
    // SizeConfig.init(context);
    return Scaffold(
      body: Consumer<OnBoardingProvider>(
        builder: (context, provider, child) => Column(
          children: [
            Container(
                width: double.infinity,
                height: sizeConfig.getScreenHeight(440),
                alignment: Alignment.center,
                child: PageView.builder(
                  onPageChanged: (value) =>
                    provider.onoPageChange(value)
                  ,
                    itemCount: list.length,
                    controller: provider.controller,
                    itemBuilder: (context, index) {
                    var item = list[index];
                    var scale = provider.activeIndex == index ? 1.0 : 0.8;
                      return TweenAnimationBuilder(
                          tween: Tween(begin: scale , end: scale),
                          curve: Curves.ease,
                          duration: const Duration(milliseconds: 500),
                          builder: (context , value , child){
                            return Transform.scale(scale: value,
                            child: list[provider.activeIndex].screen,);
                          });
                    })),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s18)),
            TitleOnBoarding(list: list, activeIndex: provider.activeIndex),


            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s5)),

            DescriptionOnBoarding(
                list: list, activeIndex: provider.activeIndex),
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s40)),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(list.length, (index) => SliderIndicator(activeIndex: index, currantPage: provider.currantPage,)),
            ),

            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s30)),

            if (provider.activeIndex + 1 != list.length)
              ElevatedButton(
                onPressed: () {
                  provider.controller.nextPage(
                      duration: const Duration( milliseconds: 500),
                      curve: Curves.linear);
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
            addVerticalSpace(sizeConfig.getScreenHeight(17)),

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
            addVerticalSpace(sizeConfig.getScreenHeight(AppSize.s33))
          ],
        ),
      ),
    );
  }
}
