

import 'package:pet_care/resources/assets_manager.dart';

class OnBoardingModel{
  OnBoardingModel({required this.svgPath, required this.title, required this.desc});
  final String svgPath;
  final String title;
  final String desc;

  static List<OnBoardingModel> data = [
    OnBoardingModel(
        svgPath: SvgAssets.onBoardingSvg1,
        title: 'Care for your pet',
        desc: 'Pet care helps with a few simple steps to take care of your beloved pet on a daily basis'
    ),
    OnBoardingModel(
        svgPath: SvgAssets.onBoardingSvg2,
        title: 'Shop easily',
        desc: 'Get all pet accessories from one place by this app noe enjoy a hassle-free shopping'
    ),
    OnBoardingModel(
        svgPath: SvgAssets.onBoardingSvg3,
        title: 'Find vet quickly',
        desc: 'Picking according to the veterinarian’s expert list is always at hand if your pet feels sick.'
    ),
  ];
}
