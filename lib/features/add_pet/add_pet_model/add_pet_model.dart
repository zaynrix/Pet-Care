
import 'package:flutter/material.dart';
import 'package:pet_care/resources/assets_manager.dart';
import 'package:pet_care/resources/colors_manager.dart';

class AddPetModel {
  String name;
  String iconPath;
  Color backgroundColor;
  bool isSelect;

  AddPetModel(
      {required this.name,
        required this.iconPath,
        required this.backgroundColor,
        required this.isSelect,
      });

   static final List<AddPetModel> petSpecies = [
    AddPetModel(name: "Dog", iconPath: IconAssets.dogType, backgroundColor: ColorManager.secondaryLight, isSelect: false),
    AddPetModel(name: "Cat", iconPath: IconAssets.catType, backgroundColor: ColorManager.quaternary, isSelect: false),
    AddPetModel(name: "Bird", iconPath: IconAssets.birdType, backgroundColor: ColorManager.greenLight, isSelect: false),
    AddPetModel(name: "Other", iconPath: IconAssets.otherType, backgroundColor: ColorManager.tertiary, isSelect: false),
  ];
}