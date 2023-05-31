import 'package:flutter/material.dart';

class PetGenderModel{
  PetGenderModel({required this.type, required this.isSelect });
  final bool isSelect;
  final String type;

  static final List<PetGenderModel> genderType = [
    PetGenderModel(type: "Male", isSelect: false,)
  ];
}