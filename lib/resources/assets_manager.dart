const String imagePath = "assets/images";

class ImageAssets {
  static const String dogMedicine = "$imagePath/dog_medicine.png";

}

//--------------------------------iconAssets------------------------------------

const String iconPath = 'assets/icons';

class IconAssets {
  static const String appleIcon = '$iconPath/apple_icon.svg';
  static const String googleIcon = '$iconPath/google_icon.svg';
  static const String plus = '$iconPath/plus.svg';

  //---------------------------------addPet-------------------------------------

  static const String birdType = "$iconPath/pet_types/bird.svg";
  static const String catType = "$iconPath/pet_types/cat.svg";
  static const String dogType = "$iconPath/pet_types/dog.svg";
  static const String otherType = "$iconPath/pet_types/other.svg";

  //---------------------------------gender-------------------------------------

  static const String female = "$iconPath/gender_female.svg";
  static const String male = "$iconPath/gender_male.svg";

  //------------------------bottomAppBar----------------------------------------

  static const String unSelectedCart = "$iconPath/navBarIcons/unSelected/shop_unselected.svg";

}
//--------------------------------SvgAssets-------------------------------------

const String svgPath = 'assets/svg';

class SvgAssets {
  static const String firstOnBoarding =
      '$svgPath/onboarding/first_onboarding.svg';
  static const String secondOnBoarding =
      '$svgPath/onboarding/second_onboarding.svg';
  static const String thirdOnBoarding =
      '$svgPath/onboarding/last_onboarding.svg';

  //---------------------------firstShapes-------------------------------------------

  static const String firstScreenFirstShabe =
      '$svgPath/onboarding/onboarding_screens_shapes/first_screen/first_shape.svg';
  static const String firstScreenSecondShabe =
      '$svgPath/onboarding/onboarding_screens_shapes/first_screen/second_shape.svg';
  static const String firstScreenPet =
      '$svgPath/onboarding/onboarding_screens_shapes/first_screen/pest_svg.svg';

  //---------------------------secondShapes-------------------------------------

  static const String secondScreenFirstShape =
      '$svgPath/onboarding/onboarding_screens_shapes/second_screen/first_shape.svg';
  static const String secondScreenSecondShape =
      '$svgPath/onboarding/onboarding_screens_shapes/second_screen/second_shape.svg';
  static const String secondScreenPet =
      '$svgPath/onboarding/onboarding_screens_shapes/second_screen/second_pet.svg';

  //----------------------------------------------------------------------------

  static const successAddPet = "$svgPath/success_add_pet.svg";

  //--------------------------pannerSvg-----------------------------------------

  static const firstBanner = "$svgPath/banner_svg.svg";
  static const List banners = [
    SvgAssets.firstBanner,
    SvgAssets.firstBanner,
    SvgAssets.firstBanner,
  ];
}
