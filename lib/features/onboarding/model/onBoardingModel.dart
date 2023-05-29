

import 'package:pet_care/resources/assets_manager.dart';

class OnBoardingModel{
  OnBoardingModel({required this.svgPath, required this.title, required this.desc , required this.currantPage});
  final String svgPath;
  final String title;
  final String desc;
  final int currantPage;

  static List<OnBoardingModel> data = [
    OnBoardingModel(
        svgPath: SvgAssets.firstOnBoarding,
        title: 'Care for your pet',
        desc: 'Pet care helps with a few simple steps to take care of your beloved pet on a daily basis',
      currantPage: 0
    ),
    OnBoardingModel(
        svgPath: SvgAssets.secondOnBoarding,
        title: 'Shop easily',
        desc: 'Get all pet accessories from one place by this app noe enjoy a hassle-free shopping',
      currantPage: 1,
    ),
    OnBoardingModel(
        svgPath: SvgAssets.thirdOnBoarding,
        title: 'Find vet quickly',
        desc: 'Picking according to the veterinarian’s expert list is always at hand if your pet feels sick.',
      currantPage: 2
    ),
  ];
}
