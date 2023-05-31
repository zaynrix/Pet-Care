import 'package:flutter/material.dart';
import 'package:pet_care/resources/assets_manager.dart';

class PetGenderModel{
  PetGenderModel({required this.type, required this.isSelect , required this.iconPath });
  bool isSelect;
  final String type;
  final String iconPath;
  static final List<PetGenderModel> genderType = [
    PetGenderModel(type: "Male", isSelect: false, iconPath: IconAssets.male),
    PetGenderModel(type: "Female", isSelect: false, iconPath: IconAssets.female),
  ];
}