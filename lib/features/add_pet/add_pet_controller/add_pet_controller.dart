import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_care/features/add_pet/add_pet_model/add_pet_model.dart';
import 'package:pet_care/features/add_pet/add_pet_model/pet_gender_model.dart';
import 'package:pet_care/routing/routing_module.dart';
import 'package:pet_care/utils/enums.dart';
import 'package:pet_care/utils/helper.dart';

class AddPetController extends GetxController {


  int activeIndex = 0;
  static int currantPage = 0;
  PageController? pageController;
  double progressValue = Get.width * (0.13);
  double  progressBarValue = Get.width * (0.13);
  final List<AddPetModel> types = List.unmodifiable(AddPetModel.petSpecies);
  final List<PetGenderModel> genders = PetGenderModel.genderType;

  bool isFile = false;
  File? fileImage;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    debugPrint("This is inside init in controller");
    pageController  = PageController(initialPage: currantPage);
    pageController!.addListener(() {
      activeIndex = pageController!.page!.round();
      update();
      });
  }


  void goNextScreen(){
    if (pageController != null) {
      pageController!.nextPage(
          duration: const Duration(milliseconds: 350),
          curve: Curves.linear);
    }
  }


  //----------------------------onPageChange------------------------------------

  onPageChange(int value) {
    currantPage = value;
    progressBarValue += progressValue;
    debugPrint("This is inside onPageChange $currantPage");
    update();
  }


  //-----------------------------selectPetType----------------------------------

  String? petTypeSelection;

  choosePetType({required String type}) {
    for (var item in types) {
      item.isSelect = item.name == type;
    }
    petTypeSelection = type;
    update();
  }


  //---------------------------selectPetType------------------------------------

  selectPetType(){
    if (petTypeSelection != null) {
      goNextScreen();
    }
    else{
      Helpers.showSnackBar(message: "Please Select Your Pet Type");
    }
  }

  //-----------------------------addPetBreed------------------------------------
  String petBreed = "";
  addPetBreed({required String breed}){
    petBreed = breed;
    update();
    if (petBreed.isEmpty) {
      Helpers.showSnackBar(message: "Please Add Your Pet Breed");
    } else{
      goNextScreen();
    }
  }

  //-----------------------selectPetGender-------------------------------------

  String? genderType;
  choosePetGender({required String type}) {
    for (var item in genders) {
      item.isSelect = item.type == type;
    }
    genderType = type;
    update();
  }

  selectGender(){
    if (genderType != null) {
      goNextScreen();
    }  else{
      Helpers.showSnackBar(message: "Please Select Your Pet Gender");
    }
  }


  static double? progressBarStatus() {
    double factor = 0.13;
    double screenWidth = MediaQuery.of(Helpers.scaffoldKey.currentState!.context).size.width;
    if (currantPage >= 0 && currantPage <= 7) {
      return screenWidth * (currantPage + 1) * factor;
    }
    return screenWidth;
  }


  //----------------------------selectIsPetNeuter-------------------------------

  PetNeuterOption selectedOption = PetNeuterOption.notSelected;

  void chooseNatureOption(PetNeuterOption option) {
    selectedOption = option;
    update();
  }

  selectPetNeuter(){
    if (selectedOption != PetNeuterOption.notSelected) {
      goNextScreen();
    }
    else {
      Helpers.showSnackBar(message: "Please Choose Pet Neuter");
    }
  }

  //----------------------------pickImage---------------------------------------

Future<dynamic> pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile == null) return;
    final file = File(pickedFile.path);
    fileImage = file;
    update();
  }

  selectPitImage(){
    if (fileImage != null) {
      RouteService.serviceNavi.pushNamedWidget(RouteGenerator.successAddPatScreen);
      disposeData();
    } else {
      Helpers.showSnackBar(message: "Please Add Photo For Your Pet");
    }

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  disposeData(){
    currantPage = 0;
    fileImage = null;
    selectedOption = PetNeuterOption.notSelected;
    genderType = null;
    petBreed = "";
    petTypeSelection = null;
    activeIndex = 0;
    pageController!.position;
    update();
  }

}