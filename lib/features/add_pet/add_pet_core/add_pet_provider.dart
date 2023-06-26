import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pet_care/features/add_pet/add_pet_model/add_pet_model.dart';
import 'package:pet_care/features/add_pet/add_pet_model/pet_gender_model.dart';
import 'package:pet_care/locator.dart';
import 'package:pet_care/resources/size_config.dart';
import 'package:pet_care/utils/enums.dart';
import 'package:pet_care/utils/helper.dart';

class AddPetProvider extends ChangeNotifier {
  final SizeConfig sizeConfig = sl<SizeConfig>();

   PageController? pageController ;
  int activeIndex = 0;
  int currantPage = 0;
  double progressValue = MediaQuery.of(Helpers.scaffoldKey.currentState!.context).size.width * (0.13);
  double  progressBarValue = MediaQuery.of(Helpers.scaffoldKey.currentState!.context).size.width * (0.13);
  final List<AddPetModel> types = AddPetModel.petSpecies;
  final List<PetGenderModel> genders = PetGenderModel.genderType;

  bool isFile = false;
  File? fileImage;

  void initStateAddPet() {
    pageController = PageController(initialPage: currantPage);
    pageController!.addListener(() {
      activeIndex = pageController!.page!.round();
      notifyListeners();
    });
  }


  //----------------------------onPageChange------------------------------------

  onPageChange(int value) {
    currantPage = value;
    progressBarValue += progressValue;
    debugPrint("This is inside onPageChange $currantPage");
    notifyListeners();
  }


  //-----------------------------selectPetType----------------------------------

  selectPetType({required String type}) {
    for (var item in types) {
      item.isSelect = false;
    }
    final index = types.indexWhere((element) => element.name == type);
    types[index].isSelect = true;
    notifyListeners();
  }


  //-----------------------selectPetGender-------------------------------------
  selectPetGender({required String type}) {
    for (var item in genders) {
      item.isSelect = false;
    }
    final index = genders.indexWhere((element) => element.type == type);
    genders[index].isSelect = true;
    notifyListeners();
  }


  static double? progressBarStatus(int page) {
    double factor = 0.13;
    double screenWidth = MediaQuery.of(Helpers.scaffoldKey.currentState!.context).size.width;
    if (page >= 0 && page <= 7) {
      return screenWidth * (page + 1) * factor;
    }
    return screenWidth;
  }


  //----------------------------selectIsPetNeuter-------------------------------

  PetNeuterOption selectedOption = PetNeuterOption.notSelected;

  void selectOption(PetNeuterOption option) {
    selectedOption = option;
    notifyListeners();
  }

  //----------------------------pickImage---------------------------------------

Future<dynamic> pickImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile == null) return;
    final file = File(pickedFile.path);
    fileImage = file;
    notifyListeners();
  }

}