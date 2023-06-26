const String imagePath = "assets/images";

class ImageAssets {
  static const String dogMedicine = "$imagePath/dog_medicine.png";
  static const String productDetails = "$imagePath/product_details_image.png";
  static const String bannerImage = "$imagePath/banner_image.png";
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
  static const String likeSelected = "$iconPath/like_selected.svg";
  static const String likeUnselected = "$iconPath/like_unselected.svg";
  static const String edit = "$iconPath/edit.svg";
  static const String email = "$iconPath/email.svg";
  static const String mobile = "$iconPath/mobile.svg";
  static const String cancel = "$iconPath/cancel.svg";
  static const String visa = "$iconPath/visa.svg";
  static const String mastercard = "$iconPath/mastercard.svg";
  static const String paypal = "$iconPath/paypal.svg";
  static const String location = "$iconPath/location.svg";
  static const String homeAddress = "$iconPath/home_address.svg";
  static const String workAddress = "$iconPath/work_address.svg";
  static const String delete = "$iconPath/delete.svg";

  //---------------------------------gender-------------------------------------

  static const String female = "$iconPath/gender_female.svg";
  static const String male = "$iconPath/gender_male.svg";

  //------------------------bottomAppBar----------------------------------------

  static const String unSelectedCart = "$iconPath/navBarIcons/unSelected/shop_unselected.svg";
  static const String unSelectedProfile = "$iconPath/navBarIcons/unSelected/person_unselected.svg";
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

  //--------------------------bannerSvg-----------------------------------------

  static const firstBanner = "$svgPath/banner_svg.svg";
  static const List banners = [
    SvgAssets.firstBanner,
    SvgAssets.firstBanner,
    SvgAssets.firstBanner,
  ];
}
