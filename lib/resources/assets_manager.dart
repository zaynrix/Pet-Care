const String imagePath = "assets/images";
const String animationsPath = "assets/animations";

class ImageAssets {
  static const String dogMedicine = "$imagePath/dog_medicine.png";
  static const String productDetails = "$imagePath/product_details_image.png";
  static const String bannerImage = "$imagePath/banner_image.png";
  static const String dog = "$imagePath/dog.png";
  static const String dog2 = "$imagePath/dog2.png";
  static const String articleImage = "$imagePath/article_image.png";
  static const String bigDog = "$imagePath/big_dog.png";
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
  static const String search = "$iconPath/search.svg";
  static const String vaccine = "$iconPath/vaccine.svg";
  static const String rightBack = "$iconPath/right_back.svg";
  static const String delivery = '$iconPath/delivery.svg';
  static const String plusButton = '$iconPath/plusButton.svg';
  static const String incrementButton = '$iconPath/increment.svg';
  static const String decrementButton = '$iconPath/decrement.svg';
  static const String clock = "$iconPath/clock.svg";
  static const String payment = "$iconPath/payment.svg";
  static const String calendar = "$iconPath/calendar.svg";

  // static const String notificationSelected =
  //     "$iconPath/navBarIcons/selected/notification_selected.svg";
  static const String pill = "$iconPath/pill.svg";
  static const String exercise = "$iconPath/exercise.svg";
  static const String liquid = "$iconPath/liquid.svg";
  static const String notificationSelected =
      "$iconPath/navBarIcons/selected/notification_selected.svg";
  static const String unSelectedNotification =
      "$iconPath/un_selected_notification.svg";


  //---------------------------------gender-------------------------------------

  static const String female = "$iconPath/gender_female.svg";
  static const String male = "$iconPath/gender_male.svg";

  //------------------------bottomAppBar----------------------------------------


  //-------------------------unSelected----------------------------------------
  static const String unSelectedCart =
      "$iconPath/navBarIcons/unSelected/shop_unselected.svg";
  static const String unSelectedProfile =
      "$iconPath/navBarIcons/unSelected/person_unselected.svg";
  static const String unSelectedHome =
      "$iconPath/navBarIcons/unSelected/home_unselected.svg";
  static const String unSelectedPets =
      "$iconPath/navBarIcons/unSelected/pets_unselected.svg";

  //---------------------------selected-----------------------------------------
  static const String homeSelected = "$iconPath/navBarIcons/selected/home_selected.svg";
  static const String profileSelected = "$iconPath/navBarIcons/selected/person_selected.svg";
  static const String petsSelected = "$iconPath/navBarIcons/selected/pets_selected.svg";
  static const String shopSelected = "$iconPath/navBarIcons/selected/shop_selected.svg";
}
//--------------------------------SvgAssets-------------------------------------

const String svgPath = 'assets/svg';
const String pngPath = 'assets/images';

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
  static const firstBannerPng = "$pngPath/banner1.png";
  static const List banners = [
    SvgAssets.firstBanner,
    SvgAssets.firstBanner,
    SvgAssets.firstBanner,
  ];

  static const List bannersPng = [
    SvgAssets.firstBannerPng,
    SvgAssets.firstBannerPng,
    SvgAssets.firstBannerPng,
  ];
}

const String jsonPath = 'assets/json';

class JsonAssets {
  static const mapStyle = "$jsonPath/map_style.json";
}

class AnimationsAssets {
  AnimationsAssets._();
  static const String success = "$animationsPath/success.json";
}
